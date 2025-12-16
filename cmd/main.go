package main

import (
	"flag"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
)

func extractHelper(version string) (string, error) {
	name := fmt.Sprintf("tools/%s-%s/%s/nu", runtime.GOOS, runtime.GOARCH, version)
	data, err := FS.ReadFile(name)
	if err != nil {
		return "", fmt.Errorf("version not found: %s", version)
	}

	home, _ := os.UserHomeDir()
	outDir := filepath.Join(home, ".local", "bin", version)
	if err := os.MkdirAll(outDir, 0755); err != nil {
		return "", err
	}

	outPath := filepath.Join(outDir, "nu")
	if _, err := os.Stat(outPath); err == nil {
		return outPath, nil
	}

	if err := os.WriteFile(outPath, data, 0755); err != nil {
		return "", err
	}

	return outPath, nil
}

func run(path string, args []string) error {
	cmd := exec.Command(path, args...)
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}

func main() {
	var version string

	flag.StringVar(&version, "version", "105", "helper version")
	flag.Parse()
	if version < "105" {
		fmt.Fprintf(os.Stderr, "version %s is not supported\n", version)
		os.Exit(250)
	}

	path, err := extractHelper(version)
	if err != nil {
		os.Exit(250)
	}


	if err := run(path, flag.Args()); err != nil {
		os.Exit(1)
	}
}

//go:build linux && amd64
// +build linux,amd64

package main

import "embed"

//go:embed tools/linux_amd64/*
var FS embed.FS
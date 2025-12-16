//go:build darwin && arm64
// +build darwin,arm64

package main

import "embed"

//go:embed tools/darwin-arm64/*
var FS embed.FS
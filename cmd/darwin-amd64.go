//go:build darwin && amd64
// +build darwin,amd64

package main

import "embed"

//go:embed tools/darwin_amd64/*
var FS embed.FS
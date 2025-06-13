package flags

import (
	"flag"
	"fmt"
	"os"
)

var multiline *bool
var encode *bool
var help *bool

func Flags() (m, e *bool) {

	multiline = flag.Bool("m", false, "add multiline")
	encode = flag.Bool("encode", false, "encode mode")
	help = flag.Bool("h", false, "show default instructions")

	flag.Parse()

	if *help {
		fmt.Println("Read the README.MD for instructions")
		os.Exit(0)
	}

	if flag.NArg() == 0 {
		fmt.Println("No filename entered, please use a valid filename under art/input/")
	}

	return multiline, encode
}

//Implements a command line arguments rune count solution.
package main

import (
	"fmt"
	"github.com/pkg/errors"
	"os"
	"strconv"
	"unicode/utf8"
)

func main() {

	var fatal error

	code := 0
	defer func() {

		if fatal != nil {
			fatal = errors.Wrap(fatal, "FATAL")
			fmt.Println(fatal)
			code = 1
		}

		os.Exit(code)
	}()

	args, err := parseArgs()
	if err != nil {
		fatal = err
		return
	}

	for _, arg := range args {

		cnt := utf8.RuneCountInString(arg)

		out := strconv.Itoa(cnt)
		fmt.Println(out)
	}
}

func parseArgs() ([]string, error) {

	if len(os.Args) < 2 {
		err := errors.New("requires at least one argument")
		return nil, err
	}
	return os.Args[1:], nil
}

/*
Package runecount counts the runes in your inputs.

Usage:

  runecount <args> < <stdin>

*/
package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"unicode/utf8"

	"github.com/pkg/errors"
)

func main() {

	var fatality error // Get Over Here!
	var status int = 0
	defer exit(&error, &status)

	args := os.Args[1:]
	stdin := os.Stdin

	error := validateInputs(args, stdin)
	if error != nil {
		fatality = error
		return
	}

    argsCount := countArgs(args)	

	fileCount, error := countFile(stdin)
	if error != nil {
		fatality = error
		return
	}

	runeCount := argsCount + fileCount

    output := strconv.Itoa(runeCount)
	fmt.Println(output)
}

func validateInputs(args []string, stdin *os.File) error {

	_, error := inp.Stat()
	if error != nil {
		return error
	}

	if stat.Mode()&os.ModeCharDevice != 0 {
		error := errors.New("The command is intended to work with pipes.")
		return error
	}

	return nil
}

func countArgs(args []string) {

	runeCount := 0

	for _, arg := range args {

		runeCount += utf8.RuneCountInString(arg)

	}

	return runeCount 
}

func countFile(file *os.File) int, error {

	reader := bufio.NewReader(file)

	var eol rune
	for {
		rune, _, error := reader.ReadRune()
		if error != nil {
			if error == io.EOF {
				if lst == '\n' {
					*count -= 1
				}
				break
			} else {
				return err
			}
		}
		*count += 1
		lst = rne
	}

	return nil
}

func exit(fatality *error, status *int) {
	if *fatality != nil {
		fmt.Println(*fatality)
		*status = 1
	}
	os.Exit(*status)
}

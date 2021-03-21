//Implements a streaming length solution.
package main

import (
	"bufio"
	"errors"
	"fmt"
	"io"
	"os"
)

func main() {

	var err error
	var cde int
	defer exit(&err, &cde)

	var inp *os.File = os.Stdin
	err = chkInput(inp)
	if err != nil {
		return
	}

	var cnt int
	err = cntRunes(&cnt, inp)
	if err != nil {
		return
	}

	fmt.Println(cnt)
}

func chkInput(inp *os.File) error {

	stat, err := inp.Stat()
	if err != nil {
		return err
	}

	if stat.Mode()&os.ModeCharDevice != 0 {
		err = errors.New("The command is intended to work with pipes.")
		return err
	}

	return nil
}

func cntRunes(cnt *int, inp *os.File) error {

	reader := bufio.NewReader(inp)

	var lst rune
	for {
		rne, _, err := reader.ReadRune()
		if err != nil {
			if err == io.EOF {
				if lst == '\n' {
					*cnt -= 1
				}
				break
			} else {
				return err
			}
		}
		*cnt += 1
		lst = rne
	}

	return nil
}

func exit(err *error, cde *int) {
	if *err != nil {
		fmt.Println(*err)
		*cde = 1
	}
	os.Exit(*cde)
}

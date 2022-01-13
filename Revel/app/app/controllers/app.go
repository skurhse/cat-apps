package controllers

import (
	"strings"

	"github.com/revel/revel"
)

type App struct {
	*revel.Controller
}

func (c App) Hello(name string) revel.Result {
	if name == "" {
		name = "Meow"
	}
	name = strings.Title(name)
	return c.Render(name)
}

func (c App) Goodbye() revel.Result {
	return c.Render()
}

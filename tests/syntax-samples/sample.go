package sample

import (
	"context"
	"fmt"
)

type Renderer[T any] interface {
	Render(context.Context, T) (string, error)
}

type Palette struct {
	Name string
}

func (p Palette) Render(_ context.Context, value int) (string, error) {
	return fmt.Sprintf("%s: %d", p.Name, value), nil
}

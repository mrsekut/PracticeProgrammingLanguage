package main

import (
	"github.com/reactivex/rxgo/connectable"
	"github.com/reactivex/rxgo/handlers"
	"github.com/reactivex/rxgo/iterable"
)

func main() {
	items := []interface{}{1, 3.1416, &struct{ foo string }{"bar"}}
	it, err := iterable.New(items)
	if err != nil {
		panic(err)
	}

	myStream := connectable.From(it)
	nums := []interface{}{}

	onNext := handlers.NextFunc(func(item interface{}) {
		switch item := item.(type) {
		case int, float64:
			nums = append(nums, item)
			println("hello", nums)
		}
	})

	sub := myStream.Subscribe(onNext).Subscribe(onNext).Connect()
	<-sub
}

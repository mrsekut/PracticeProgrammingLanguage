package main

import (
	"fmt"

	"github.com/reactivex/rxgo/handlers"
	"github.com/reactivex/rxgo/observable"
)

func main() {

	onNext := handlers.NextFunc(func(item interface{}) {
		fmt.Printf("Processing: %v\n", item)
	})

	source := observable.Range(1, 21) // observableの生成(?)
	sub := source.Subscribe(onNext)   // observableをsubscribe

	<-sub
}

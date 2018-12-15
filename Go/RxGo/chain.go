package main

import (
	"github.com/reactivex/rxgo/fx"
	"github.com/reactivex/rxgo/handlers"
	"github.com/reactivex/rxgo/observable"
)

func main() {

	nums := []int{}

	onNext := handlers.NextFunc(func(item interface{}) {
		if num, ok := item.(int); ok {
			println(num)
			nums = append(nums, num)
		}
	})

	fizz := func(target interface{}) fx.FilterableFunc {
		return func(item interface{}) bool {
			if num, ok := item.(int); ok {
				if num%3 == 0 {
					return true
				}
			}
			return false
		}
	}

	myStream := observable.Range(1, 100).Filter(fizz(0))
	sub := myStream.Subscribe(onNext)
	<-sub
}

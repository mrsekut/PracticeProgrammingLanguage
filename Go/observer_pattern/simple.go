package main

import (
	"fmt"
)

// Subject
// =======================

type Subject struct {
	observers []Observer
}

// constructor `New`で始める
func NewSubject(name string) *Subject {
	return &Subject{observers: []Observer{}}
}

// method
func (nb *Subject) registerObserver(o Observer) {
	nb.observers = append(nb.observers, o)
}

func (self *Subject) notifyObservers() {
	for _, obserber := range self.observers {
		obserber.notify()
	}
}

// Observer
// =======================

type Param string

type IObserver interface {
	notify(p Param)
}

type Observer struct {
	name string
	IObserver
}

func NewObserver(name string) *Observer {
	return &Observer{name: name}
}

func (self *Observer) notify() {
	fmt.Printf("name: %v\n", self.name)
}

// main
// =======================

func main() {
	oreilly := NewSubject("oreilly")
	john := NewObserver("john")
	paul := NewObserver("paul")

	oreilly.registerObserver(*john)
	oreilly.registerObserver(*paul)

	oreilly.notifyObservers()
}

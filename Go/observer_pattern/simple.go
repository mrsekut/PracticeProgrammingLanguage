package main

import (
	"fmt"
)

// 具象クラス Subject
// =======================

type Subject struct {
	observers []Observer
}

func NewSubject(name string) *Subject {
	return &Subject{observers: []Observer{}}
}

func (s *Subject) addObserver(o Observer) {
	s.observers = append(s.observers, o)
}

func (s Subject) notifyObservers() {
	for _, observer := range s.observers {
		observer.notify()
	}
}

// 具象クラス Observer
// =======================

type IObserver interface {
	notify()
}

type Observer struct {
	name string
	IObserver
}

func NewObserver(name string) *Observer {
	return &Observer{name: name}
}

func (o Observer) notify() {
	fmt.Printf("hello! i am %v\n", o.name)
}

// main
// =======================

func main() {
	s := NewSubject("sms")
	mom := NewObserver("mom")
	gf := NewObserver("girlFriend")

	s.addObserver(*mom)
	s.addObserver(*gf)

	s.notifyObservers()
}

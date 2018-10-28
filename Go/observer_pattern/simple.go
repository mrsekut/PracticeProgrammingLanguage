package main

import "fmt"

// 具象クラス Subject
// =======================

type Subject struct {
	name      string
	observers []Observer
}

func newSubject(name string) *Subject {
	return &Subject{name: name, observers: []Observer{}}
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

type Observer interface {
	notify()
}

type Child struct {
	name string
}

func newChild(name string) *Child {
	return &Child{name: name}
}

func (o Child) notify() {
	fmt.Printf("hello! i am %v\n", o.name)
}

// main
// =======================

func main() {
	s := newSubject("sms")
	mom := newChild("mom")
	gf := newChild("girlFriend")

	s.addObserver(*mom)
	s.addObserver(*gf)

	s.notifyObservers()
}

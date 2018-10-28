package main

import "fmt"

// 具象クラス Subject
// =======================

type Subject struct {
	name      string
	observers []Observer
}

func newSubject(name string) *Subject {
	return &Subject{name, []Observer{}}
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

type ConcreteOverserver struct {
	name string
}

func newObserver(name string) *ConcreteOverserver {
	return &ConcreteOverserver{name}
}

func (c ConcreteOverserver) notify() {
	fmt.Printf("hello! i am %v\n", c.name)
}

// main
// =======================

func main() {
	s := newSubject("sms")
	mom := newObserver("mom")
	gf := newObserver("girlFriend")

	s.addObserver(*mom)
	s.addObserver(*gf)

	s.notifyObservers()
}

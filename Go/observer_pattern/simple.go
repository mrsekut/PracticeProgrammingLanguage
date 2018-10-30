package main

import "fmt"

// 具象クラス Subject
// =======================

type Subject struct {
	observers []Observer
}

func newSubject() *Subject {
	return &Subject{[]Observer{}}
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
	fmt.Printf("%vさん、ハリポタが発売されました!\n", c.name)
}

// main
// =======================

func main() {
	publisher := newSubject()
	tarou := newObserver("tarou")
	hanako := newObserver("hanako")

	publisher.addObserver(*tarou)
	publisher.addObserver(*hanako)

	publisher.notifyObservers()
}

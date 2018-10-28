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
		nObserver(observer)
	}
}

func nObserver(n Notify) {
	n.notify()
}

// 具象クラス Observer
// =======================

type Notify interface {
	notify()
}

type Observer struct {
	name string
}

func newObserver(name string) *Observer {
	return &Observer{name: name}
}

func (o Observer) notify() {
	fmt.Printf("hello! i am %v\n", o.name)
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

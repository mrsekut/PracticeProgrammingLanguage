package main

import "fmt"

// 具象クラス Subject
// =======================

type Subject struct {
	title     string
	observers []Observer
}

func newSubject(title string) *Subject {
	return &Subject{title, []Observer{}}
}

func (s *Subject) addObserver(o Observer) {
	s.observers = append(s.observers, o)
}

func (s Subject) notifyObservers() {
	for _, observer := range s.observers {
		observer.notify(s.title)
	}
}

// 抽象クラス Observer
// =======================

type Observer interface {
	notify(title string)
}

type ConcreteOverserver struct {
	name string
}

func newObserver(name string) *ConcreteOverserver {
	return &ConcreteOverserver{name}
}

// 具象クラス Tarou, Hanako extends Observer
// =======================

type Tarou struct {
	*ConcreteOverserver
}

func newTarou(name string) *Tarou {
	return &Tarou{newObserver(name)}
}

func (g Tarou) notify(title string) {
	fmt.Printf("%vさん、%vが発売されました!\n", g.name, title)
}

type Hanako struct {
	*ConcreteOverserver
}

func newHanako(name string) *Hanako {
	return &Hanako{newObserver(name)}
}

func (g Hanako) notify(title string) {
	fmt.Printf("%vさん、%vが発売されました!\n", g.name, title)
}

// main
// =======================

func main() {
	publisher := newSubject("BookA")
	tarou := newTarou("tarou")
	hanako := newHanako("hanako")

	publisher.addObserver(*tarou)
	publisher.addObserver(*hanako)

	publisher.notifyObservers()
}

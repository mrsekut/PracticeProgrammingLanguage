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

// 抽象クラス Observer
// =======================

type Observer interface {
	notify()
}

type ConcreteOverserver struct {
	name string
}

func newObserver(name string) *ConcreteOverserver {
	return &ConcreteOverserver{name: name}
}

// 具象クラス Mum,  GirlFriend extends Observer
// =======================

type Mom struct {
	*ConcreteOverserver
}

func newMom() *Mom {
	return &Mom{newObserver("mom")}
}

func (g Mom) notify() {
	fmt.Printf("%vは,今帰ったでえ！！\n", g.name)
}

type GirlFriend struct {
	*ConcreteOverserver
}

func newGirlFriend() *GirlFriend {
	return &GirlFriend{newObserver("Hanako")}
}

func (g GirlFriend) notify() {
	fmt.Printf("%vは,今帰ったよ\n", g.name)
}

// main
// =======================

func main() {
	sms := newSubject("sms")
	mom := newMom()
	gf := newGirlFriend()

	sms.addObserver(*mom)
	sms.addObserver(*gf)

	sms.notifyObservers()
}

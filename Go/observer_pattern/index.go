package main

import "fmt"

// =======================
// 抽象クラス Subject
// =======================

type Subject struct {
	observers []Observer
}

func NewSubject() *Subject {
	return &Subject{observers: []Observer{}}
}

func (self *Subject) registerObser(observer Observer) {
	self.observers = append(self.observers, observer)
}

// func removeObserver

// func (self *Subject) notify() {}

// =======================
// 具象クラス SMS extends Subject
// =======================

type SMS struct {
	*Subject
}

func NewSMS() *SMS {
	return &SMS{Subject: NewSubject()}
}

func (self *SMS) notifyObservers() {
	for _, observer := range self.observers {
		observer.notify()
	}
}

func (self *SMS) iAmHome() {
	self.notifyObservers()
}

// =======================
// 抽象クラス Observer
// =======================

type IObserver interface {
	notify()
}

type Observer struct {
	id      int
	subject SMS
	IObserver
}

// constructor
func NewObserver(id int, subject SMS) *Observer {
	// subject.registerObser()
	return &Observer{id: id, subject: subject}
}

// =======================
// 具象クラス GirlFriend,Mum  extends Observer
// =======================

type GirlFriend struct {
	*Observer
}

func NewGirlFriend(id int, subject SMS) *GirlFriend {
	return &GirlFriend{Observer: NewObserver(id, subject)}
}

func (self *GirlFriend) notify(time string) {
	fmt.Printf("今帰ったよ %v", time)
}

// =======================
// main
// =======================

func main() {

	sms := NewSMS()
	NewGirlFriend(2, *sms)

	sms.iAmHome()
}

package main

import "fmt"

// =======================
// 抽象クラス Subject
// =======================

// ?
// type observer interface {
// }

// // structの中にはフィールドを記述
// type Subject struct {
// 	observers []observer
// }

// // LIGの`registerObserver`
// func (self *Subject) addObserver(observer observer) {
// 	self.observers = append(self.observers, observer)
// }

// func (self *subject) removeObserver(observer observer){
// 	oid := observer.id

// LIGには具象クラスに中身を書いているけど(なんで？),抽象クラスで定義
// func (self *Subject) notifyObservers() []int {
// 	var result []int
// 	for _, observer := range self.observers {
// 		result = append(result, observer)
// 	}
// }

// =======================
// 具象クラス SMS extends Subject
// =======================

// type SMS struct {
// 	*Subject
// }

type SMS struct {
	time      string
	observers []IObserver
}

func NewSMS() *SMS {
	return &SMS{time: "", observers: []IObserver{}}
}

func (self *SMS) registerObserver(observer IObserver) {
	self.observers = append(self.observers, observer)
}

// func removeObserver

func (self *SMS) notifyObservers() {
	for _, observer := range self.observers {
		observer.notify()
	}
}

// func (self, *SMS) iAmHome() {
// 	self.notifyObservers()
// }

// =======================
// 抽象クラス Observer
// =======================

type IObserver interface {
	notify()
}

type Observer struct {
	id      int
	subject SMS
}

// constructor
func NewObserver(id int, subject SMS) *Observer {
	obs := &Observer{id: id, subject: subject}
	subject.registerObserver(obs.IObserver)
	return obs
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

	sms.notifyObservers()
}

// 継承ver
package main

import "fmt"

// =======================
// 具象クラス Subject
// =======================
// こっちも抽象化できるが(?)冗長になるので省略
// やるなら例えば、SMS以外に、電話とかにして、台詞を全く変えるなど

type Subject struct {
	name      string
	observers []Observer
}

func newSubject(name string) *Subject {
	return &Subject{name: name, observers: []Observer{}}
}

// method
func (s *Subject) addObserver(o Observer) {
	s.observers = append(s.observers, o)
}

func (s Subject) notifyObservers() {
	for _, observer := range s.observers {
		observer.notify()
	}
}

// =======================
// 抽象クラス Observer
// =======================

type Notify interface {
	notify()
}

type Observer struct {
	name string
	Notify
}

func newObserver(name string) *Observer {
	return &Observer{name: name}
}

// =======================
// 具象クラス GirlFriend,Mum  extends Observer
// =======================
// nameを設定したい
// 要件:　クラスごとに通知内容を全く別物にしたい

// type Mom struct {
// 	*Observer
// }

// func newMom() *Mom {
// 	return &Mom{&Observer{name: "Mom"}}
// }

// func (g *Mom) notify() {
// 	fmt.Printf("%vは,今帰ったでえ！！", g.name)
// }

type GirlFriend struct {
	*Observer
}

func newGirlFriend() *GirlFriend {
	// return &GirlFriend{newObserver("Hanako")}
	// return &GirlFriend{Observer: newObserver("Hanako")}
	return &GirlFriend{&Observer{name: "Hanako"}}
}

func (g *GirlFriend) notify() {
	fmt.Printf("%vは,今帰ったよ", g.name)
}

// =======================
// main
// =======================

func main() {

	sms := newSubject("sms")
	// mom := newMom()
	gf := newGirlFriend()
	// gf.notify()

	// sms.addObserver(*mom)
	sms.addObserver(*gf)

	sms.notifyObservers()

}

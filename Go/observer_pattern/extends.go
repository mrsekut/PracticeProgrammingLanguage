/*
無理やり継承を用いたパターン
Goの勉強としては良いが、Observerパターンを学ぶ目的を主とすると適切ではないのでボツにする。

今後、GOの継承を学ぶときに(まとめるときに)読むと良いかもしれないリンク集
- kindle スターティングGo「構造体を含む構造体」
- https://oinume.hatenablog.com/entry/golang-struct-and-interface
- https://qiita.com/kitoko552/items/a6698c68379a8cd8b999#embed%E5%9F%8B%E3%82%81%E8%BE%BC%E3%81%BF
- https://qiita.com/tenntenn/items/e04441a40aeb9c31dbaf#%E5%9F%8B%E3%82%81%E8%BE%BC%E3%81%BF%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%9F%E3%82%A4%E3%83%B3%E3%82%BF%E3%83%95%E3%82%A7%E3%83%BC%E3%82%B9%E3%81%AE%E9%83%A8%E5%88%86%E5%AE%9F%E8%A3%85
- http://otiai10.hatenablog.com/entry/2014/01/15/220136
- http://otiai10.hatenablog.com/entry/2014/05/27/223556
- https://postd.cc/is-go-object-oriented/
- https://qiita.com/tenntenn/items/e04441a40aeb9c31dbaf#%E5%9F%8B%E3%82%81%E8%BE%BC%E3%81%BF%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%9F%E3%82%A4%E3%83%B3%E3%82%BF%E3%83%95%E3%82%A7%E3%83%BC%E3%82%B9%E3%81%AE%E9%83%A8%E5%88%86%E5%AE%9F%E8%A3%85
*/
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

func (t Tarou) notify(title string) {
	fmt.Printf("%vさん、%vが発売されました!\n", t.name, title)
}

type Hanako struct {
	*ConcreteOverserver
}

func newHanako(name string) *Hanako {
	return &Hanako{newObserver(name)}
}

func (h Hanako) notify(title string) {
	fmt.Printf("%vさん、%vが発売されました!\n", h.name, title)
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

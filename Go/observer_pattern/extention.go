package main

import (
	"fmt"
	"sync"
)

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

func (s *Subject) deleteObserver(o Observer) {
	obs := s.observers[0:0]
	for _, v := range s.observers {
		if v != o {
			obs = append(obs, v)
		}
	}
	s.observers = obs
}

func (s Subject) notifyObservers() {
	var wg sync.WaitGroup
	wg.Add(len(s.observers))

	for _, observer := range s.observers {
		go func() {
			observer.notify(s.title)
			wg.Done()
		}()
	}

	wg.Wait()
}

// 具象クラス Observer
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

func (c ConcreteOverserver) notify(title string) {
	fmt.Printf("%vさん、%vが発売されました!\n", c.name, title)
}

// main
// =======================

func main() {
	publisher := newSubject("BookA")
	tarou := newObserver("tarou")
	hanako := newObserver("hanako")

	publisher.addObserver(*tarou)
	publisher.addObserver(*hanako)

	publisher.deleteObserver(*tarou)

	publisher.notifyObservers()
}

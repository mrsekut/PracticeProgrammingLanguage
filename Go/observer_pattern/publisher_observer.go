// 参考: https://tech.recruit-mp.co.jp/front-end/post-11511/
package main

import "fmt"

// =======================
// 抽象クラス Subject
// =======================

// =======================
// 具象クラス SMS extends Subject
// =======================

type Publisher struct {
	name    string
	readers []Reader
}

func NewPublisher(name string) *Publisher {
	return &Publisher{name: name, readers: []Reader{}}
}

func (self *Publisher) on(reader Reader) {
	self.readers = append(self.readers, reader)
}

func (self *Publisher) notify() {
	for _, reader := range self.readers {
		reader.onNewBook()
	}
}

// =======================
// 抽象クラス Observer
// =======================

// =======================
// 具象クラス GirlFriend,Mum  extends Observer
// =======================

type Reader struct {
	name string
}

func NewReader(name string) *Reader {
	return &Reader{name: name}
}

func (self *Reader) onNewBook() {
	fmt.Printf("name: %v\n", self.name)
}

// =======================
// main
// =======================

func main() {

	oreilly := NewPublisher("oreilly")
	john := NewReader("john")
	paul := NewReader("paul")

	oreilly.on(*john)
	oreilly.on(*paul)

	oreilly.notify()
}

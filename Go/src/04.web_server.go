package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hi %s!", r.URL.Path[1:])
}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8000", nil)
}

// access to localhost:8000/maru

// net/http
// ============================

func main() {
	// Getメソッドの実行
	res, err := http.Get("https://www.google.com/")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(res)
}

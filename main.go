package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	log.Println("start server")

	http.HandleFunc("/ping", ping)
	http.ListenAndServe(":3000", nil)
}

func ping(res http.ResponseWriter, req *http.Request) {
	fmt.Fprint(res, "pong")
}

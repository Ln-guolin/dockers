package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	print("正在启动程序，请访问：http://localhost:3000")
	http.HandleFunc("/", home)
	log.Fatal(http.ListenAndServe(":3000", nil))
}

func home(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World，This is first go web for docker")
}

package main

/*
#include <stdio.h>
#include <stdlib.h>

float hello[10] = {0, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8};

float* myprint(char* s) {
	printf("%s\n", s);
	return hello;
}
*/
import "C"

import (
	"fmt"
	"unsafe"
)

// https://github.com/golang/go/wiki/cgo
func Example() {
	cs := C.CString("Hello from stdio\n")
	v := C.myprint(cs)
	fmt.Println("v: ", v)
	slice := (*[10]float32)(unsafe.Pointer(v))[:10:10]
	fmt.Println("slice: ", slice)
	C.free(unsafe.Pointer(cs))
}

func main() {
	Example()
}

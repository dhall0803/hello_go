package main

import "testing"

func TestSayHello(t *testing.T) {
	want := "Hello World!"
	if got := sayHello(); got != want {
		t.Errorf("sayHello() = %q, want %q", got, want)
	}
}

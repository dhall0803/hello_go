package main

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

func sayHello() string {
	return "Hello World!"
}

func main() {
	// Create a new Gin router
	router := gin.Default()

	// Define a route for the root path
	router.GET("/", func(c *gin.Context) {
		c.String(200, fmt.Sprintln(sayHello()))
	})

	// Run the server on port 80
	router.Run(":80")
}

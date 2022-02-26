/*
 * start.go
 *
 * Copyright 2022 Dariusz Sikora <dev@isangeles.pl>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 *
 *
 */

package main

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"os/exec"
	"time"
)

// Main function.
func main() {
	runServer()
	time.Sleep(1000) // wait for server to start
	runAi()
	runGui()
}

// runServer starts game server in the background.
func runServer() {
	server := exec.Command("./server")
	out, err := server.StdoutPipe()
	if err != nil {
		panic(fmt.Errorf("Unable to get server out: %v", err))
	}
	go readOutput(out)
	err = server.Start()
	if err != nil {
		panic(fmt.Errorf("Unable to start server: %v", err))
	}
}

// runAi starts game AI in the background.
func runAi() {
	ai := exec.Command("./ai")
	out, err := ai.StdoutPipe()
	if err != nil {
		panic(fmt.Errorf("Unable to get AI out: %v", err))
	}
	go readOutput(out)
	err = ai.Start()
	if err != nil {
		panic(fmt.Errorf("Unable to start AI: %v", err))
	}
}

// runGui starts game GUI and waits for it to exit.
func runGui() {
	gui := exec.Command("./gui")
	out, err := gui.StdoutPipe()
	if err != nil {
		panic(fmt.Errorf("Unable to get GUI out: %v", err))
	}
	go readOutput(out)
	err = gui.Run()
	if err != nil {
		panic(fmt.Errorf("Unable to start GUI: %v", err))
	}
}

// readOutput starts scanning specified reader for output messages.
func readOutput(reader io.ReadCloser) {
	out := bufio.NewScanner(reader)
	for out.Scan() {
		if out.Err() != nil {
			log.Printf("Unable to read output: %v", out.Err())
		}
		log.Printf("%s", out.Text())
	}
}

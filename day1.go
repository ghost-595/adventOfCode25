package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	file, _ := os.Open("/Users/jkellynz/IdeaProjects/AdventOfCode25/Day1InputPart1.txt")
	defer file.Close()
	
	scanner := bufio.NewScanner(file)
	position := 50
	count := 0

	for scanner.Scan() {
		line := scanner.Text()
		direction := line[0]
		distance, _ := strconv.Atoi(line[1:])

		if direction == 'L' {
			for i := 0; i < distance; i++ {
				position = (position - 1 + 100) % 100
				if position == 0 {
					count++
				}
			}
		} else {
			for i := 0; i < distance; i++ {
				position = (position + 1) % 100
				if position == 0 {
					count++
				}
			}
		}
	}

	fmt.Println(count)
}

package utils

import "fmt"

func Encode(input string) (output string) {

	inputLen := len(input)
	var result string
	currentIndex := 0

	for currentIndex < inputLen {
		patternFlag := false

		// check for sequential patterns longer than 1 letter

		for patternLen := 1; patternLen <= (inputLen-currentIndex)/2; patternLen++ {
			pattern := input[currentIndex : currentIndex+patternLen]
			repeatedPattern := 1
			for nextIndex := currentIndex + patternLen; nextIndex+patternLen <= inputLen; nextIndex += patternLen {
				if input[nextIndex:nextIndex+patternLen] == pattern {
					repeatedPattern++
				} else {
					break
				}
			}

			if repeatedPattern > 1 {
				result += fmt.Sprintf("[%d %s]", repeatedPattern, pattern)
				currentIndex += repeatedPattern * patternLen
				patternFlag = true
				break
			}
		}

		// handle 1 letter sequential patterns or no patterns

		if !patternFlag {
			charPattern := 1
			for currentIndex+charPattern < inputLen && input[currentIndex] == input[currentIndex+charPattern] {
				charPattern++
			}
			if charPattern < 1 {
				result += fmt.Sprintf("[%d %s]", charPattern, string(input[currentIndex]))
				currentIndex += charPattern
			} else {
				result += string(input[currentIndex])
				currentIndex++
			}
		}
	}

	return result
}

package utils

import (
	"regexp"
	"strconv"
	"strings"
)

// Decode processes an encoded ASCII string and returns the decoded result.
// It gracefully returns error messages if any part is malformed.
func Decode(code string) string {
	var final strings.Builder
	var lastPos int

	// This regex finds all [n string] patterns (e.g. [5 *], [3 _])
	re := regexp.MustCompile(`\[[^\]]*\]`)

	// Find all matching strings and their positions
	matches := re.FindAllString(code, -1)
	positions := re.FindAllStringIndex(code, -1)

	for i, match := range matches {
		// Remove [ and ] from the matched string
		inner := strings.TrimSuffix(strings.TrimPrefix(match, "["), "]")
		parts := strings.SplitN(inner, " ", 2)

		// Validation: must contain exactly two parts
		if len(parts) != 2 {
			return "Error: Pattern must have a number and a string separated by a space."
		}

		// Try to parse the first part as a number
		count, err := strconv.Atoi(strings.TrimSpace(parts[0]))
		if err != nil || count < 1 {
			return "Error: First argument must be a positive number."
		}

		// Second part can be empty (interpreted as space), but must not be nil
		// `[13  ]` → 13 spaces is valid
		text := parts[1]

		// Safely append decoded part and anything before it
		final.WriteString(code[lastPos:positions[i][0]])
		final.WriteString(strings.Repeat(text, count))
		lastPos = positions[i][1]
	}

	// Append any remaining text after the last match
	final.WriteString(code[lastPos:])

	return final.String()
}

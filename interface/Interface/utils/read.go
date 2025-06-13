package utils

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
)

func Read(fileName string) (readFileSaved []string){
	fileProcessing := []string{}

	filePath := filepath.Join("input", fileName)

	file, err := os.Open(filePath)
	if err != nil {
		fmt.Printf("Could not open file %s %v", fileName, err)
		os.Exit(0)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		line := scanner.Text()
		fileProcessing = append(fileProcessing, line)
	}


return fileProcessing
	
}
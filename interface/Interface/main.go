package main

// 📦 Standard Library Imports
import (
	"flag"
	"fmt"
	"html/template"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	// 🧠 Internal Modules
	"art/flags"
	"art/utils"
)

// 🌐 GET / — Loads initial web form with status 200
func handleLanding(w http.ResponseWriter, r *http.Request) {
	data := struct {
		Result     string
		Error      string
		Text       string
		Mode       string
		Multiline  bool
		StatusCode int
	}{
		StatusCode: http.StatusOK,
	}

	tmpl, err := template.ParseFiles(filepath.Join("web", "static", "index.html"))
	if err != nil {
		http.Error(w, "Failed to load homepage", http.StatusInternalServerError)
		return
	}
	tmpl.Execute(w, data)
}

// 🌐 POST /decoder — Processes encode/decode requests from form
func handleDecoder(w http.ResponseWriter, r *http.Request) {
	err := r.ParseForm()
	if err != nil {
		http.Error(w, "Form error", http.StatusBadRequest)
		return
	}

	text := strings.TrimSpace(r.FormValue("text"))
	mode := r.FormValue("mode")
	multiline := r.FormValue("multiline") != ""
	var result, errorMsg string
	statusCode := http.StatusAccepted

	if text == "" {
		errorMsg = "Text input cannot be empty!"
		statusCode = http.StatusBadRequest

	} else if !multiline && strings.Contains(text, "\n") {
		errorMsg = "Multiline input not allowed unless checkbox is checked."
		statusCode = http.StatusBadRequest

	} else if mode == "decode" {
		result = utils.Decode(text)
		if strings.HasPrefix(result, "Error:") {
			errorMsg = result
			result = ""
			statusCode = http.StatusBadRequest
		}
	} else if errorMsg == "" {
		if multiline {
			lines := strings.Split(text, "\n")
			for i, line := range lines {
				lines[i] = utils.Encode(line)
			}
			result = strings.Join(lines, "\n")
		} else {
			result = utils.Encode(text)
		}
	}

	renderTemplate(w, result, errorMsg, text, mode, multiline, statusCode)
}

// 🎨 renderTemplate — Central output rendering function
func renderTemplate(w http.ResponseWriter, result, errorMsg, text, mode string, multiline bool, statusCode int) {
	data := struct {
		Result     string
		Error      string
		Text       string
		Mode       string
		Multiline  bool
		StatusCode int
	}{
		Result:     result,
		Error:      errorMsg,
		Text:       text,
		Mode:       mode,
		Multiline:  multiline,
		StatusCode: statusCode,
	}

	tmpl, err := template.ParseFiles(filepath.Join("web", "static", "index.html"))
	if err != nil {
		http.Error(w, "Error loading template", http.StatusInternalServerError)
		return
	}

	var buf strings.Builder
	if err := tmpl.Execute(&buf, data); err != nil {
		http.Error(w, "Error executing template", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(statusCode)
	w.Write([]byte(buf.String()))
}

// 🏁 Entry point — supports both CLI and web server
func main() {
	startServer := flag.Bool("s", false, "Start web server")
	flag.Parse()

	if *startServer {
		// 🌍 Web server mode
		http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("web/static"))))
		http.HandleFunc("/", handleLanding)
		http.HandleFunc("/decoder", handleDecoder)

		fmt.Println("✅ Server running: http://localhost:8080")
		if err := http.ListenAndServe(":8080", nil); err != nil {
			fmt.Println("❌ Server failed:", err)
		}
		return
	}

	// 🖥️ CLI mode
	multilineFlag, encodeFlag := flags.Flags()

	if flag.NArg() < 1 {
		fmt.Println("No input provided")
		os.Exit(1)
	}

	input := flag.Arg(0)

	if *multilineFlag {
		lines := strings.Split(input, "\n")
		for i, line := range lines {
			if *encodeFlag {
				lines[i] = utils.Encode(line)
			} else {
				lines[i] = utils.Decode(line)
			}
		}
		fmt.Println(strings.Join(lines, "\n"))
	} else {
		if *encodeFlag {
			fmt.Println(utils.Encode(input))
		} else {
			fmt.Println(utils.Decode(input))
		}
	}
}

#!/bin/bash

# Check if a chapter name was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ChapterName>"
    exit 1
fi

# The chapter name is the first command line argument
CHAPTER_NAME="$1"
LaTeX_PATH="LaTeX"


# Convert markdown to LaTeX using pandoc
pandoc "${CHAPTER_NAME}.md" -o "${CHAPTER_NAME}.tex" --filter pandoc-xnos --lua-filter=cite-to-latex.lua

# Move the output LaTeX file to the specified directory
mv "${CHAPTER_NAME}.tex" "$LaTeX_PATH"

cd LaTeX
pdflatex main.tex
xdg-open main.pdf


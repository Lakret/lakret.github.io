echo "Serving from `ipconfig getifaddr en1`:1111..."

zola serve --interface 0.0.0.0 --port 1111

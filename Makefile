PANDOC_BASE_OPTIONS=--standalone
PANDOC_HTML_OPTIONS=$(PANDOC_BASE_OPTIONS) --toc -w html5 --css=styling.css --mathjax
PANDOC_PDF_OPTIONS=$(PANDOC_BASE_OPTIONS) -V links-as-notes=true --pdf-engine=xelatex

all: pdf html

styling.css:
	curl -L -O https://b.enjam.info/panam/styling.css

.PHONY: pdf
pdf:
	pandoc $(shell cat pandoc_list.txt) -o main.pdf $(PANDOC_PDF_OPTIONS)

.PHONY: html
html: styling.css
	pandoc $(shell cat pandoc_list.txt) -o index.html $(PANDOC_HTML_OPTIONS)

clean:
	rm main.pdf || true
	rm index.html || true
	rm styling.css || true

M=main
LATEXMK = latexmk

include make/t.mk
include make/i.mk

a=-interaction=nonstopmode

$M.pdf: $M.tex $t $i
	$(LATEXMK) $a -output-directory=.tmp -pdf $< && \
	cp .tmp/$@ $@

png: $M.pdf
	tool/pdfpng $M.pdf png

zip: $M.zip
	git archive --format=zip -o $M.zip HEAD

.PHONY: clean
clean:
	@echo clean
	@rm -fr .tmp $M.pdf

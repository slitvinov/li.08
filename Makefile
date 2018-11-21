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

.PHONY: clean
clean:
	@echo clean
	@rm -fr .tmp $M.pdf

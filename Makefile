M=main
LATEXMK = latexmk

include make/t.mk
include make/i.mk

a=-interaction=nonstopmode

$M.pdf: $M.tex $t $i
	$(LATEXMK) $a -output-directory=.tmp -pdf $< && \
	cp .tmp/$@ $@

png: $M.pdf; tool/pdfpng $M.pdf png
zip: $M.zip
$M.zip: $M.pdf; git archive --format=zip -o $@ HEAD

.PHONY: clean png zip
clean:
	@echo clean
	@rm -fr .tmp $M.pdf

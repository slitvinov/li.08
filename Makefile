M=main
LATEXMK = latexmk

include make/t.mk

a=-interaction=nonstopmode
i=

$M.pdf: $M.tex $t
	$(LATEXMK) $a -output-directory=.tmp -pdf $< && \
	cp .tmp/$@ $@

.PHONY: clean
clean:
	@echo clean
	@rm -fr .tmp $M.pdf

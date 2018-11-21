M=main
LATEXMK = latexmk

include make/t.mk

a=-interaction=nonstopmode
i=

$M.pdf: $M.tex $t
$M.pdf:; $(LATEXMK) -pdf $M.tex

.PHONY: clean
clean:
	@echo clean
	@rm -f $M.aux $M.log $M.nav $M.out $M.pdf $M.snm $M.toc

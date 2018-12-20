SOURCES=$(wildcard ./bib/*.bib ./sections/*.tex ./figures/*/*.tex)

# all: HH-white-paper.pdf

# %.pdf: %.tex $(SOURCES)
# 				pdflatex -interaction=nonstopmode -halt-on-error $(basename $@)
# 				makeglossaries $(basename $@)
# 				pdflatex -interaction=nonstopmode -halt-on-error $(basename $@)
# 				biber $(basename $@)
# 				pdflatex -interaction=nonstopmode -halt-on-error $(basename $@)
# 				pdflatex -interaction=nonstopmode -halt-on-error $(basename $@)

# cleanpartial:
# 				-@rm *.aux *.bbl *.bcf *.blg *.dvi *.glg *.glo *.gls *.ist *.lof *.log *.lot *.out *.ps *.run.xml *.toc 2>/dev/null || true

# clean: cleanpartial
# 				-@rm *.pdf 2>/dev/null || true


# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: HH-white-paper.pdf all clean

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: HH-white-paper.pdf

# CUSTOM BUILD RULES

# In case you didn't know, '$@' is a variable holding the name of the target,
# and '$<' is a variable holding the (first) dependency of a rule.
# "raw2tex" and "dat2tex" are just placeholders for whatever custom steps
# you might have.

# %.tex: %.raw
#         ./raw2tex $< > $@

# %.tex: %.dat
#         ./dat2tex $< > $@

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

HH-white-paper.pdf: HH-white-paper.tex $(SOURCES)
	latexmk -shell-escape -pdf -lualatex -use-make HH-white-paper.tex

clean:
	latexmk -CA

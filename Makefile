SHELL := /usr/bin/bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c

MAIN := main.tex
OUT  := out

.PHONY: pdf watch clean

pdf:
	# ensure out/ and all subdirs for includes exist
	mkdir -p $(OUT)
	if [ -d ressources ]; then find ressources -type d -exec mkdir -p $(OUT)/{} \; ; fi
	latexmk -pdf -interaction=nonstopmode -synctex=1 -shell-escape -outdir=$(OUT) $(MAIN)

watch:
	mkdir -p $(OUT)
	if [ -d ressources ]; then find ressources -type d -exec mkdir -p $(OUT)/{} \; ; fi
	latexmk -pvc -pdf -interaction=nonstopmode -synctex=1 -shell-escape -outdir=$(OUT) $(MAIN)

clean:
	latexmk -C -outdir=$(OUT)
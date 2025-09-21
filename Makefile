MAIN ?= bachelor-thesis
TEX  := $(MAIN).tex
OUT  ?= out

LATEXMK := latexmk -pdf -interaction=nonstopmode -synctex=1 -outdir=$(OUT)

.PHONY: pdf clean watch nomencl

pdf:
	@mkdir -p $(OUT)
	@if [ -d ressources ]; then find ressources -type d -exec mkdir -p $(OUT)/{} \; ; fi
	@$(LATEXMK) $(TEX)

watch:
	@$(LATEXMK) -pvc $(TEX)

nomencl:
	@if [ -f $(OUT)/$(MAIN).nlo ]; then makeindex $(OUT)/$(MAIN).nlo -s nomencl.ist -o $(OUT)/$(MAIN).nls; fi

clean:
	@$(LATEXMK) -C
	@rm -rf $(OUT)
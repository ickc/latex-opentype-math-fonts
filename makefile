FONTS = $(wildcard fonts/*.tex)
TEXS = $(patsubst fonts/%.tex,output/%.tex,$(FONTS))
PDFS = $(patsubst fonts/%.tex,output/%.pdf,$(FONTS))

pdf: $(PDFS)
tex: $(TEXS)

output/%.tex: template/preamble.tex fonts/%.tex template/doc.tex
	cat $^ > $@

output/%.pdf: output/%.tex
	cd output; latexmk -lualatex $(<F)

clean:
	cd output; rm -rf *.aux *.fdb_latexmk *.fls *.log *.tex

Clean: clean
	cd output; rm -rf *.pdf

open:
	cd output; open *.pdf

print-%:
	$(info $* = $($*))

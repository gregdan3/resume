RESUMECLI=$(shell npm bin)/resume

INPUT=resume.json
OUTDIR=out
OUTPUT=gregdan3-resume.pdf

THEME=Elegant

.PHONY: serve validate all

all: $(OUTDIR)/$(OUTPUT)

$(OUTDIR)/$(OUTPUT): $(INPUT)
	@mkdir -p $(@D)
	$(RESUMECLI) export ./$(OUTDIR)/$(OUTPUT) --theme $(THEME)

clean:
	rm $(OUTDIR)/$(OUTPUT)

serve: $(INPUT)
	$(RESUMECLI) serve --theme $(THEME)

validate: $(INPUT)
	$(RESUMECLI) validate

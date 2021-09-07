RESUMECLI=$(shell npm bin)/resume

INPUT=resume.json
OUTDIR=out
OUTPUT=gregdan3-resume.pdf

THEME=flat

.PHONY: serve validate all init

all: $(OUTDIR)/$(OUTPUT)

build: all

init:
	npm install

$(OUTDIR)/$(OUTPUT): $(INPUT)
	@mkdir -p $(@D)
	$(RESUMECLI) export ./$(OUTDIR)/$(OUTPUT) --theme $(THEME)

clean:
	rm $(OUTDIR)/$(OUTPUT)

serve: $(INPUT)
	$(RESUMECLI) serve --theme $(THEME)

validate: $(INPUT)
	$(RESUMECLI) validate

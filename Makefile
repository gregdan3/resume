RESUMECLI=$(shell npm bin)/resume

INPUT=resume.json
THEME=kendall

BUILD_OUTDIR=./out
BUILD_OUTPUT=gregdan3-resume.html
SERVE_OUTDIR=./public
SERVE_OUTPUT=index.html
# TODO: SERVE_OUTPUT changes depending on theme

.PHONY: build serve init validate clean

build: $(BUILD_OUTDIR)/$(BUILD_OUTPUT)
serve: $(SERVE_OUTDIR)/$(SERVE_OUTPUT)
force: clean build
$(BUILD_OUTDIR)/$(BUILD_OUTPUT): $(INPUT)
	@mkdir -p $(@D)
	$(RESUMECLI) export $(BUILD_OUTDIR)/$(BUILD_OUTPUT) --theme $(THEME)
$(SERVE_OUTDIR)/$(SERVE_OUTPUT): $(INPUT)
	@mkdir -p $(@D)
	$(RESUMECLI) serve $(SERVE_OUTDIR)/$(SERVE_OUTPUT) --theme $(THEME)

init: package.json package-lock.json  # insurance
	npm install
validate: $(INPUT)
	$(RESUMECLI) validate
clean:
	rm -f $(BUILD_OUTDIR)/$(BUILD_OUTPUT) $(SERVE_OUTDIR)/$(SERVE_OUTPUT)

JUPYTER = jupyter

HTML_FILES = $(patsubst %.ipynb,%.html,$(wildcard *.ipynb))
PDF_FILES = $(patsubst %.ipynb,%.pdf,$(wildcard *.ipynb))
TEX_FILES = $(patsubst %.ipynb,%.tex,$(wildcard *.ipynb))
MD_FILES = $(patsubst %.ipynb,%.md,$(wildcard *.ipynb))
PY_FILES = $(patsubst %.ipynb,%.py,$(wildcard *.ipynb))
RST_FILES = $(patsubst %.ipynb,%.rst,$(wildcard *.ipynb))
SLIDES_FILES = $(patsubst %.ipynb,%_slides.html,$(wildcard *.ipynb))

.PHONY : all clean init publish html pdf latex tex markdown md python py rst slides
	
all: html


html: $(HTML_FILES)

pdf: $(PDF_FILES)

latex: $(TEX_FILES)

tex: $(TEX_FILES)

markdown: $(MD_FILES)

md: $(MD_FILES)

python: $(PY_FILES)

py: $(PY_FILES)

rst: $(RST_FILES)

slides: $(SLIDES_FILES)


%.html: %.ipynb
	$(JUPYTER) nbconvert --execute $<

%.pdf: %.ipynb
	$(JUPYTER) nbconvert --to pdf --execute $<

%.tex: %.ipynb
	$(JUPYTER) nbconvert --to latex --execute $<

%.md: %.ipynb
	$(JUPYTER) nbconvert --to markdown --execute $<

%.py: %.ipynb
	$(JUPYTER) nbconvert --to python --execute $<

%.rst: %.ipynb
	$(JUPYTER) nbconvert --to rst --execute $<

%_slides.html: %.ipynb
	$(JUPYTER) nbconvert --to slides --execute $<


clean:
	@echo "Remove output files"
	@rm -f $(HTML_FILES) $(PDF_FILES) $(TEX_FILES) $(MD_FILES) $(PY_FILES) $(RST_FILES) $(SLIDES_FILES)
	@rm -rf __pycache__/

init: clean

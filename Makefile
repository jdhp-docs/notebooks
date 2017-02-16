include meta.make

###############################################################################

JUPYTER = jupyter

HTML_FILES = $(patsubst %.ipynb,%.html,$(wildcard *.ipynb))
PDF_FILES = $(patsubst %.ipynb,%.pdf,$(wildcard *.ipynb))
TEX_FILES = $(patsubst %.ipynb,%.tex,$(wildcard *.ipynb))
MD_FILES = $(patsubst %.ipynb,%.md,$(wildcard *.ipynb))
PY_FILES = $(patsubst %.ipynb,%.py,$(wildcard *.ipynb))
RST_FILES = $(patsubst %.ipynb,%.rst,$(wildcard *.ipynb))
SLIDES_FILES = $(patsubst %.ipynb,%_slides.html,$(wildcard *.ipynb))
JDHP_FILES = $(patsubst %.ipynb,%.jdhp,$(wildcard *.ipynb))

.PHONY : all clean init jdhp publish html pdf latex tex markdown md python py rst slides
	
all: html

###############################################################################

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

jdhp: $(JDHP_FILES)

publish: jdhp

###############################################################################

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

# PUBLISH #####################################################################

%.jdhp: %.html
	# JDHP_DL_URI is a shell environment variable that contains the destination
	# URI of the PDF files.
	@if test -z $$JDHP_DL_URI ; then exit 1 ; fi
	
	# JDHP_DOCS_URI is a shell environment variable that contains the
	# destination URI of the HTML files.
	@if test -z $$JDHP_DOCS_URI ; then exit 1 ; fi
	
	# Upload the HTML files
	rsync -v -e ssh $< ${JDHP_DOCS_URI}/$(NAME)/
	
	# Upload the Notebooks
	# See https://www.gnu.org/software/make/manual/html_node/Quick-Reference.html
	rsync -v -e ssh $(patsubst %.html,%.ipynb,$<) ${JDHP_DL_URI}/notebook/$(NAME)/
	
	# TODO: upload 2 .ipynb files, one without output (e.g. foo.ipynb) and the
	# other with output (e.g. foo.out.ipynb) and push the second one on
	# publication plateforms like http://nbviewer.jupyter.org/
	
	touch $@

## CLEAN ######################################################################

clean:
	@echo "Remove output files"
	@rm -f $(HTML_FILES) $(PDF_FILES) $(TEX_FILES) $(MD_FILES) $(PY_FILES) $(RST_FILES) $(SLIDES_FILES) $(JDHP_FILES)
	@rm -rf __pycache__/
	@echo "Strip output from Jupyter Notebook files"
	@./tools/strip_ipynb_output.py *.ipynb

init: clean

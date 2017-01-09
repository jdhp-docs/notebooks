# TODO

## Step 1: commit and publish notebooks

* [ ] Expliquer dans le README le pourquoi de la double indirection pour
      .gitignore, Makefile, etc. dans mes notebooks (python_notebooks,
      fft_notebook, ...) : ça évite d'avoir dans le référentiel des
      liens qui pointent vers l'extérieur. L'uilitsateur a alors deux choix
      possibles : soit ipynb est un répertoire qui contient le sous-module Git
      "jdhp-docs/notebook_skeleton" ; soit c'est un lien symbolique vers le
      dossier qui contient "jdhp-docs/notebook_skeleton".
* [x] Add a script to remove all results from .ipynb files, use it in the
      Makefile (in the "clean" target) and add instruction to explain how use
      it automatically with Git.
* [ ] Makefile: add a "publish" target = publish .ipynb (with outputs) and
      .html on JDHP.
* [ ] Improve the style in the HTML output: make the output more "natural" for
      readers who have never heard about Jupyter and IPython.
* [ ] Add documentation in the README file.

## Step 2: write notebooks

* [ ] Use notedown or write something similar (convert .md files to .ipynb):
      https://pypi.python.org/pypi/notedown/1.0.3,
      https://github.com/aaren/notedown,
      https://github.com/rossant/ipymd.
      Adapt Makefile targets.
* [ ] Add documentation in the README file.

## Step 3

* [ ] Add a script to improve the result of the following command:
      "jupyter nbconvert --to python file.ipynb".
      The resulting Python file should be a "natural" JDHP snippet.
      Use this script to duplicate Notebooks in JDHP snippets (which are more
      convenient to consult from a terminal).
      Should it use RST instead Markdown for text (RST titles are more ascii
      friendly, ...) ?
* [ ] Add documentation in the README file.

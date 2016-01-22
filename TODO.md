# TODO

## Step 1: commit and publish notebooks

* [ ] Add a script to remove all results from .ipynb files, use it in the
      Makefile (in the "clean" target) and add instruction to explain how use
      it automatically with Git.
* [ ] Makefile: add a "publish" target = publish .ipynb (with outputs) and
      .html on JDHP.
* [ ] Add documentation in the README file.

## Step 2: write notebooks

* [ ] Use notedown or write something similar (convert .md files to .ipynb).
      Adapt Makefile targets.
* [ ] Add documentation in the README file.

## Step 3

* [ ] Add a script to improve the result of the following command:
      "jupyter nbconvert --to python file.ipynb".
      The resulting Python file should be a "natural" JDHP snippet.
      Use this script to duplicate Notebooks in JDHP snippets (which are more
      convenient to consult from a terminal).
* [ ] Add documentation in the README file.

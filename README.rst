===================
`Python notebooks`_
===================

Copyright (c) 2016 Jeremie DECOCK (http://www.jdhp.org)

* Source code: https://github.com/jdhp-docs/python-notebooks

Description
===========

This repository contains a Jupyter notebook about Python, Numpy, Matplotlib, Scipy, ...

Dependencies
============

- nbutils (https://github.com/jeremiedecock/python-nbutils)

::

 pip install --pre nbutils

Recommanded Jupyter Lab extensions
==================================

::

 conda install nodejs
 jupyter labextension install @jupyterlab/toc
 jupyter labextension install @jupyter-widgets/jupyterlab-manager
 jupyter labextension install @ijmbarr/jupyterlab_spellchecker

Installation and usage
======================

After you have cloned this repository in your computer, it is recommended to
add the https://github.com/jdhp-docs/notebook-skeleton submodule in a directory
named "ipynb"::

 git clone https://github.com/jdhp-docs/python-notebooks.git
 cd python-notebooks
 git submodule add https://github.com/jdhp-docs/notebook-skeleton.git ipynb

Launch notebook
===============

With Ipython::

 $ ipython notebook

or

::

 $ ipython notebook file_name.ipynb

With Jupyter::

 $ jupyter notebook

or

::

 $ jupyter notebook file_name.ipynb


License
=======

`Python notebooks`_ is provided under the terms and conditions of the
`MIT License`_.


.. _MIT License: http://opensource.org/licenses/MIT
.. _Python notebooks: https://github.com/jdhp-docs/python-notebooks


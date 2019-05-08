===================
`Python notebooks`_
===================

Copyright (c) 2016-2019 Jeremie DECOCK (http://www.jdhp.org)

* Source code: https://github.com/jdhp-docs/notebooks

Description
===========

This repository contains a collection of Jupyter Notebooks about Programming, Maths, Data science, ...

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

With Jupyter Notebook::

 $ jupyter notebook

or

::

 $ jupyter notebook file_name.ipynb

With Jupyter Lab::

 $ jupyter lab

or

::

 $ jupyter lab file_name.ipynb


License
=======

These Jupyter Notebooks are provided under the terms and conditions of the
`MIT License`_.

.. _MIT License: http://opensource.org/licenses/MIT
.. _Python notebooks: https://github.com/jdhp-docs/python-notebooks


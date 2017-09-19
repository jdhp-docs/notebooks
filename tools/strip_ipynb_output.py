#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Copyright (c) 2016 Jérémie DECOCK (http://www.jdhp.org)

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

"""
This script strips the output of an Jupyter notebook.

It can be used as a preprocessing before commiting notebooks on Version Systems
like Git.

Here is a different way to do this: http://stackoverflow.com/questions/25178118/opening-ipython-notebook-without-output.
"""

import argparse
import json

def main():
    """Main function"""

    # PARSE OPTIONS ###########################################################

    # TODO: improve the description
    parser = argparse.ArgumentParser(description='Strip the output of Jupyter Notebooks (.ipynb files).')

    parser.add_argument("fileargs", nargs="+", metavar="FILE", help="Jupyter Notebook files to clean")

    args = parser.parse_args()

    file_paths = args.fileargs

    # CLEAN FILES #############################################################

    output_files = {}

    for file_path in file_paths:
        print("Clean", file_path)
        with open(file_path, 'r') as fd:
            notebook = json.load(fd)

            if notebook['nbformat'] == 4:
                cell_list = notebook['cells']
            elif notebook['nbformat'] == 3:
                cell_list = notebook['worksheets'][0]['cells']

            for cell in cell_list:
                # Init execution_count items
                if 'execution_count' in cell:
                    cell['execution_count'] = None

                # Remove outputs
                if 'outputs' in cell:
                    cell['outputs'] = []

                # Remove useless metadata
                if 'metadata' in cell:
                    for key in ('collapsed', 'scrolled'):
                        if key in cell['metadata']:
                            del cell['metadata'][key]

            # Remove widgets status
            if 'metadata' in notebook:
                if 'widgets' in notebook['metadata']:
                    del notebook['metadata']['widgets']

            output_files[file_path] = notebook

        # SAVE THE RESULT #####################################################

        with open(file_path, 'w') as fd:
            json.dump(notebook, fd, sort_keys=True, indent=1, ensure_ascii=False)  # pretty print format

            # Jupyter Notebook always add an empty line, thus lets do the same to avoid useless Git diff
            fd.write("\n")

if __name__ == '__main__':
    main()


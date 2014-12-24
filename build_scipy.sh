#! /bin/bash
mkdir scipy
pip install scipy --download ./scipy
cd scipy
tar -xvf scipy-*
cd $(find -maxdepth 1 -type d -name "scipy*")
python setup.py build
python setup.py bdist_wheel  -d ../../wheelhouse/

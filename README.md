travis_wheels
=============

Running CI on projects with large compiled dependencies can lead to very long build times for each testing configuration. This repository uses the new python binary package format the [wheel](http://wheel.readthedocs.org/en/latest/index.html) to store pre-compiled binaries for each of the dependacies for the [SunPy](www.sunpy.org) project.

#Motivation
SunPy has dependencies on three large scientific python packages, numpy, scipy and matplotlib. Compiling these (especially SciPy) takes upwards of 25 minutes which means there is a very long build time for each configuration of out Travis CI testing script. As well as this sometimes this build will fail and report errors on good code.

#Approach
Due to the fact that wheels are binary packages they need to be compiled on a machine that has an identical configuration to that of the one they are to be installed on. The easiest way to achieve this was to create a repository that made the Travis build farm compile the wheels. This repository therefore only contains scripts to build wheels and upload them to a FTP server.

The uploading of the wheels to an FTP server makes use of Travis' secure environment variables to store my FTP username and password, instructions for creating your own are [here](http://about.travis-ci.org/docs/user/build-configuration/#Secure-environment-variables).

When installing Python packages using pip it is possible to specify an index from which pip will search for installable packages, by default this is the PyPI. pip can handle html files as indexes, which this repository uses to allow installation of the compiled wheels. The python script make_index.py logs into the FTP server and generates a  html file containing links to all the wheels in the directory, which pip then searches.

You can install the compiled wheels using a command like this:
```bash
pip install --find-links http://yourdomian.com/wheelhouse/index.html --use-wheel --upgrade scipy
```
which will search your uploaded wheels and default back to PyPI if that fails.

#Usage
Due to the nature of pip and Travis the compiled wheels are hosted openly online. For SunPy and related projects usage I provide this hosting off my own back, I am happy for you to use my wheels and even PR to this repo if you would like to add another package or configuration. However if you do use my hosting for your project please consider donating [here](https://www.gittip.com/Cadair/).

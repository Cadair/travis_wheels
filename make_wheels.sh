#!/bin/bash
# This scipt builds all the dependacies for sunpy

#Configuration independant build
function makewheels {
	pip wheel --wheel-dir=./wheelhouse numpy==$NUMPY_VERSION
	pip install --use-wheel --no-index --find-links=./wheelhouse numpy==$NUMPY_VERSION

	pip wheel --wheel-dir=./wheelhouse matplotlib=>$MATPLOTLIB_VERSION

	pip wheel --wheel-dir=./wheelhouse pandas==$PANDAS_VERSION

	pip wheel --wheel-dir=./wheelhouse scipy

	pip wheel --wheel-dir=./wheelhouse astropy
}


makewheels

pip wheel --wheel-dir=./wheelhouse numpy==$NUMPY_VERSION_2;
pip wheel --wheel-dir=./wheelhouse matplotlib==$MATPLOTLIB_VERSION;
# Manually make pandas deps due to pip 1.4 / pytz versioning bug
pip wheel --wheel-dir=./wheelhouse pytz==2013b;
pip wheel --wheel-dir=./wheelhouse python-dateutil;
pip wheel --wheel-dir=./wheelhouse --no-deps pandas==$PANDAS_VERSION_1;
pip wheel --wheel-dir=./wheelhouse --no-deps pandas==$PANDAS_VERSION_2;

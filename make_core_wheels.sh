# Aggregate the exit status so build fails if a wheel is not created:
EXIT_STATUS=0
pip wheel --wheel-dir=./wheelhouse numpy==$NUMPY_VERSION_2 || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse matplotlib || EXIT_STATUS=$?
# Manually make pandas deps due to pip 1.4 / pytz versioning bug
pip wheel --wheel-dir=./wheelhouse pytz==2013b || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse python-dateutil || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse --no-deps pandas==$PANDAS_VERSION_1 || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse --no-deps pandas || EXIT_STATUS=$?

exit $EXIT_STATUS

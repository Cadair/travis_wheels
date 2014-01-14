# Aggregate the exit status so build fails if a wheel is not created:
EXIT_STATUS=0
pip wheel --wheel-dir=./wheelhouse --no-deps astropy || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse $SUDS_PKG || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse beautifulsoup4 || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse pytest pytest-xdist || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse h5py || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse sphinx || EXIT_STATUS=$?
#Make glymur deps manually to prevent another numpy build
pip wheel --wheel-dir=./wheelhouse contextlib2 || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse mock || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse --no-deps glymur || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse sqlalchemy || EXIT_STATUS=$?
pip wheel --wheel-dir=./wheelhouse python-coveralls || EXIT_STATUS=$?

exit $EXIT_STATUS

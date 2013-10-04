pip wheel --wheel-dir=./wheelhouse --no-deps astropy;
pip wheel --wheel-dir=./wheelhouse $SUDS_PKG;
pip wheel --wheel-dir=./wheelhouse beautifulsoup4;
pip wheel --wheel-dir=./wheelhouse pytest pytest-xdist;
pip wheel --wheel-dir=./wheelhouse h5py;
pip wheel --wheel-dir=./wheelhouse sphinx;
#Make glymur deps manually to prevent another numpy build
pip wheel --wheel-dir=./wheelhouse contextlib2;
pip wheel --wheel-dir=./wheelhouse mock;
pip wheel --wheel-dir=./wheelhouse --no-deps glymur;

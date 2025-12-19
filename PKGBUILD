# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=dask
pkgname=python-$_name
pkgver=2025.12.0
pkgrel=3
pkgdesc="Parallel computing with task scheduling"
arch=(any)
url="https://dask.org"
license=(BSD-3-Clause)
depends=(
  python
  python-click
  python-cloudpickle
  python-fsspec
  python-packaging
  python-partd
  python-yaml
  python-toolz
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
optdepends=(
# https://github.com/dask/dask/blob/main/docs/source/install.rst#optional-dependencies
#  'python-bokeh: visualizing dask diagnostics'
#  'python-cityhash: faster hashing of arrays'
  'python-distributed: distributed computing'
#  'python-fastparquet: storing and reading data from parquet files'
#  'python-gcsfs: file-system interface to Google Cloud Storage'
  'python-graphviz: graph visualization using the graphviz engine'
  'python-jinja: HTML representations of Dask objects in Jupyter notebooks'
  'python-lz4: transparent use of lz4 compression algorithm'
  'python-matplotlib: color map support for graph visualization'
#  'python-murmurhash: faster hashing of arrays'
  'python-numpy: arrays and dataframes support'
  'python-pandas: dataframes support'
  'python-psutil: more accurate CPU count'
  'python-pyarrow: Apache Arrow, for parquet support'
#  'python-s3fs: Amazon S3 support'
  'python-scipy: for dask.array.stats, dask.array.fft, and dask.array.linalg.lu'
  'python-snappy: snappy compression for reading/writing Avro or Parquet files'
#  'python-sparse: use sparse arrays as backend for dask arrays'
  'python-sqlalchemy: writing and reading from SQL databases'
  'python-xarray: N-D labeled arrays and datasets'
  'python-xxhash: faster hashing of arrays'
)
checkdepends=(
  ipython
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-timeout
  python-pytest-xdist
#  python-bokeh
#  python-cityhash
  python-distributed
#  python-fastparquet
#  python-gcsfs
  python-graphviz
  python-jinja
  python-lz4
  python-matplotlib
#  python-murmurhash
  python-numpy
  python-pandas
  python-psutil
  python-pyarrow
#  python-s3fs
  python-scipy
  python-snappy
#  python-sparse
  python-sqlalchemy
  python-xarray
  python-xxhash
)
source=(
  https://github.com/dask/dask/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
b2sums=('f6c31a4bdb8ba0d820e5b1efc91424086730d9fcdb83f682122ca3ed82e420d201185b4362629be82dc37aedbb08e7496073db9ad091f22fea156c467b4a5374')

prepare() {
  cd $_name-$pkgver
  # workaround for failing tests since Python 3.14 (dask.expr objects are not picklable)
  # https://github.com/dask/dask/issues/12043
  sed -i 's|except AttributeError:|except (AttributeError, pickle.PicklingError):|' dask/dataframe/dask_expr/tests/_util.py
}

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

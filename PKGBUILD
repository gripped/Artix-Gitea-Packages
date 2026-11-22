# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-deepdiff
pkgver=9.2.0
pkgrel=1
pkgdesc="Deep Difference and Search of any Python object/data."
url="https://github.com/qlustered/deepdiff"
license=('MIT')
arch=('any')
depends=('python-cachebox' 'python-orderly-set')
optdepends=('python-click: for cli'
            'python-tomli-w: for TOML support'
            'python-yaml: for YAML support'
            'python-clevercsv: for more robust CSV parsing'
            'python-orjson: for speed and memory optimized parsing')
makedepends=('python-build' 'python-flit-core' 'python-installer' 'git')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-clevercsv' 'python-click' 'python-dateutil'
              'python-jsonpickle' 'python-numpy' 'python-tomli-w' 'python-yaml' 'python-orjson'
              'python-pydantic' 'python-pandas' 'python-polars' 'python-pytz' 'python-uuid6')
source=("git+https://github.com/qlustered/deepdiff.git#commit=a4441929dcce8524efaf0e10ab5accbdd5b0dd7b")
sha512sums=('abc6bfc73198cc45ead72b27dc90fe4f4840ad6b3d0d2c6e2e23f78ab76d7b3a724844f6f6735cfcaa9d1dae94e450994fb2773e301a61f31fd1471d40e8b1a3')

build() {
  cd deepdiff
  python -m build --wheel --no-isolation
}

check() {
  cd deepdiff
  pytest
}

package() {
  cd deepdiff
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

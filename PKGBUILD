# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-time-machine
pkgver=3.0.0
pkgrel=1
pkgdesc='Travel through time in your tests'
arch=('x86_64')
url='https://github.com/adamchainz/time-machine'
license=('MIT')
depends=(
  'python'
  'python-dateutil'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-randomly'
  'python-tokenize-rt'
)
optdepends=(
  'python-pytest: for pytest plugin'
  'python-tokenize-rt: for the migration tool'
)
source=("$pkgname::git+$url#tag=$pkgver")
b2sums=('5cb4e0f362a2dc3832ac0f62d296a1239a8d36db9abbad09771e7d8feecc41df1cf66c8f908f68e9f0010b5b2e5b448ff002c0f45a63e0fa5f3f64c76ce22490')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/time_machine-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname"

  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

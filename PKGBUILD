# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-atpublic
_name="${pkgname#python-}"
_upstream=public
pkgver=8.0.0
pkgrel=1
pkgdesc="@public decorator for Python"
arch=(any)
url="https://gitlab.com/flufl/public"
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-sybil
)
source=($url/-/archive/$_name@$pkgver/$_upstream-$_name@$pkgver.tar.gz)
sha512sums=('cc370179ff97e3879fc5f2702613cb7fd75b361c376760a2fbf822debe5b24943cef1ce10432f741f8554c9391348f280a01133f8ef8f171964505e75729e783')
b2sums=('367d8a11d9781926dbc876881c86ce7f7fd9d62c00c420cf92ba5cf2c14853da908fb46bf63c70d4f1e262d65ccd5de5e3e4be2914a4da93d890fab65930c136')

build() {
  cd $_upstream-$_name@$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_upstream-$_name@$pkgver
  PYTHONPATH="$PWD/packages/$_name/src" pytest -vv
}

package() {
  cd $_upstream-$_name@$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

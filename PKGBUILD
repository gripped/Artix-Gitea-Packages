# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_name=mutagen
pkgname=python-mutagen
pkgver=1.48.0
pkgrel=1
arch=(any)
pkgdesc="An audio metadata tag reader and writer (python library)"
url="https://github.com/quodlibet/mutagen"
license=(GPL-2.0-or-later)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pycodestyle
  python-pyflakes
  python-pytest
)
source=($url/releases/download/release-$pkgver/$_name-$pkgver.tar.gz{,.sig})
sha512sums=('99b5fec18980e27dd85318c406928bc1d349df2f3c5d89bdd561700b2f1f1502739a98f1aba8cf9c7545dba2cfe68d765c94d957adc6de56bf9cb99951510e82'
            'SKIP')
b2sums=('4d87616520c6a2fac34b92fba396593e16c6ec9dc0635fd514482b036a57483970e1540c45a3708d96909ebb6335e9b1722b0d77cac28570afbe40438ba437e2'
        'SKIP')
validpgpkeys=('0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC') # Christoph Reiter <reiter.christoph@gmail.com>

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -v --ignore tests/quality/test_flake8.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {NEWS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}

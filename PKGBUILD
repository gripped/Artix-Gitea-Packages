# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mako
_pkgname=${pkgname#python-}
pkgver=1.3.4
_pkgver=rel_${pkgver//./_}
pkgrel=1
pkgdesc="A template library written in Python"
arch=(any)
url="https://github.com/sqlalchemy/mako"
license=(MIT)
depends=(
  python
  python-markupsafe
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  # python-lingua isn't packaged
  python-babel
  python-beaker
  python-dogpile.cache
  python-pygments
  python-pytest
)
optdepends=(
  'python-babel: for i18n features'
  'python-beaker: for caching support'
  'python-dogpile.cache: for caching support'
  'python-pygments: for syntax highlighting'
  'python-pytest: for testing utilities'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha512sums=('3413fa7a32442d3bbda3a9bcec2c1565cd4f5735f6bfef44a217ae2ba63572fd3e3755a00f5d67b89f63e379426bed827a03db3976356424ee225f4915d89ff6')

_archive="$_pkgname-$_pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

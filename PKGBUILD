# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=mkdocs-material
pkgver=9.6.4
pkgrel=1
pkgdesc="Documentation that simply works"
arch=(any)
url="https://github.com/squidfunk/mkdocs-material"
license=(ISC)
depends=(
  mkdocs
  python
  python-babel
  python-colorama
  python-jinja
  python-markdown
  # python-paginate # Not packaged
  python-regex
  python-requests
  python-yaml
)
makedepends=(
  python-build
  python-hatch-nodejs-version
  python-hatch-requirements-txt
  python-hatchling
  python-installer
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b2a238aff906b1dca0430fe48d19ecbc45d08510fd5b7b84ef1e7082ac709ac6')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

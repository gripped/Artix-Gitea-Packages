# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-py-partiql-parser
pkgver=0.6.2
pkgrel=1
pkgdesc='Python Parser for PartiQL'
arch=(any)
url='https://github.com/getmoto/py-partiql-parser'
# Most files are licensed under MIT, while an Apache 2.0 file is vendored since 0.4.0.
# See: https://github.com/getmoto/py-partiql-parser/pull/12
license=('MIT AND Apache-2.0')
depends=(python)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)
checkdepends=(python-pytest)
source=("git+$url#tag=$pkgver")
sha256sums=('46ef122656a6fd6edc435b65abca98be9a6cd2d4b2a47e9ca661c97f94fa551e')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  pytest
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

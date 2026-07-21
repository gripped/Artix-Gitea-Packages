# Maintainer: commandk <commandk@artix>

pkgname=python-pystray
pkgver=0.19.5
pkgrel=7
arch=(any)
license=(GPL-3.0-only LGPL-3.0-only)
pkgdesc='Allows to create a system tray icon'
url='https://github.com/moses-palmer/pystray'
depends=(glib2 python-six python-pillow 'python-xlib>=0.17' libappindicator-gtk3 python-gobject gtk3 python gobject-introspection-runtime)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "001-skip-docs.patch"
)
b2sums=('34bea3d14cfde7ee7a7d2594da2386265fba34b36f4699b5877ea393dbf7e844fe441a1bda384bb6b3f279a544cba897e04509f7c47d69cb5168793665ae73d4'
        '2ef7577f18503b439b11cafce04fa82fa03048b19da9461bd59b691a0766acfdf6f61aa20d12f0d2cb3be2cc742b80ba237c56b7bd57af9b8bd369ba7424dc24')

build() {
  cd pystray-$pkgver
  patch -p1 < ../001-skip-docs.patch
  python -m build --wheel --no-isolation --verbose
}

package() {
  cd pystray-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

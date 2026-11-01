# Maintainer: Giovanni Harting <anonfunc@archlinux.org>

pkgname=python-mpv-jsonipc
pkgver=1.5.0
pkgrel=1
pkgdesc='Python API to MPV using JSON IPC'
arch=(any)
url='https://github.com/iwalton3/python-mpv-jsonipc'
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a681058a35760ea6ce7aca2689287120ad672e8b2f2b72626080cc531167f1843b2bc0866039735aa421ac9a89f127b73390d2d87affc029648e3c918869d30e')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

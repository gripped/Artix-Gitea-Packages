# Maintainer: capezotte <capezotte@artixlinux.org>
# Contributor: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=qhexedit2-gui
pkgver=0.8.9
pkgrel=1
pkgdesc='Simple hex editor showcasing the qhexedit2 widget'
url='https://github.com/Simsys/qhexedit2'
arch=(x86_64)
license=(LGPL-2.1-only)
depends=(qt5-base qhexedit2)
makedepends=(cmake qt5-tools git)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('137628f926af842b9af0721fbcd2242e482ce05ed4ef050330a2073ce80f7f98')

prepare() {
  cd qhexedit2/example

  # unvendor library
  sed -i '\|../src/|d;$aLIBS = -lqhexedit' qhexedit.pro
}
build() {
  cd qhexedit2/example
  qmake-qt5 qhexedit.pro
  make
}

package() {
  cd qhexedit2/example
  install -Dm755 qhexedit "${pkgdir}/usr/bin/qhexedit"
}

# vim: ts=2 sw=2 et:

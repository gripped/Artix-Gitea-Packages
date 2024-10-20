# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname='jp2a'
pkgver=1.3.1
pkgrel=1
pkgdesc='A small utility for converting JPG images to ASCII'
arch=('x86_64')
url='https://github.com/Talinx/jp2a/'
license=('GPL-2.0-only')
depends=(
  'curl'
  'glibc'
  'libexif'
  'libjpeg-turbo'
  'libpng'
  'libwebp'
  'ncurses'
)
makedepends=(
  'doxygen'
  'git'
)
_commit=b32577dfaea0873ed811fe68ca420229fd7e3380 #refs/tags/v1.3.0
source=("git+https://github.com/Talinx/jp2a.git#tag=v${pkgver}")
sha256sums=('0e25ddb3a20cfefe3c4e9099e48ff785246bd4a394506e606b624fc143eebe74')
validpgpkeys=("5FCAE86E581E73AD91CB3235E7DBBCF6B02920CC") # Christoph Raitzig

pkgver() {
  cd "${pkgname}"
  git describe --tags | sed 's/v//'
}

prepare() {
  cd "${pkgname}"
  autoreconf -vi
}

build() {
  cd "${pkgname}"
  bashcompdir=/usr/share/bash-completion/completions ./configure --prefix='/usr'
  make
}

check() {
  cd "${pkgname}"
  make check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: André Klitzing <aklitzing () gmail () com>

pkgname=clazy
pkgver=1.11+r302+gf90c263c
pkgrel=1
_commit=f90c263c49c1df57bc442fe2fafa0e9e12460e28
pkgdesc='Qt oriented code checker based on clang framework'
url='https://www.kdab.com/'
license=(GPL-2.0-or-later)
depends=(clang
         gcc-libs
         glibc
         llvm-libs
         sh)
makedepends=(cmake
             git
             llvm)
arch=(x86_64)
source=(git+https://invent.kde.org/sdk/clazy#commit=$_commit)
sha256sums=('b618c419dca274f6e95770d605fd4dcbbfbe9e52f503b24e065cdd010874e40d')
validpgpkeys=(949014B23D24354DFD548E5457416A0ADCEF0EFE) # Sergio Martins <sergio.martins@kdab.com>

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cmake -B build $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

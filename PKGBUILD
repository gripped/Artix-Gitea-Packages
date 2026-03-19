# Maintainer: artist for Sonic-DE

pkgname=sonic-screen-library 
pkgver=6.6.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Screen management library for SonicDE Workspaces'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-screen-library'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         libxcb
         qt6-base)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
             qt6-tools)
groups=(sonicde)
conflicts=(libkscreen)
provides=(libkscreen)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  rm -r $pkgdir/usr/lib/systemd
}

sha256sums=('48876b84a96d229d329d106bd0c73225fadf57734d9a8fd326f6df76aa4cd408')


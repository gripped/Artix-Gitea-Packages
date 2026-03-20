# Maintainer: artist for Sonic-DE

pkgname=sonic-globalacceld
pkgver=6.6.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Daemon for Sonic-DE providing Global Keyboard Shortcut (Accelerator) functionality'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-globalacceld'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kglobalaccel
         kio
         kjobwidgets
         kservice
         kwindowsystem
         libx11
         libxcb
         qt6-base
         xcb-util-keysyms)
makedepends=(extra-cmake-modules)
groups=(sonicde)
conflicts=(kglobalacceld)
provides=(kglobalacceld)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$_dirver.tar.gz")

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  rm -r $pkgdir/usr/lib/systemd
}

sha256sums=('bc344f01ea48c25c4f02e4dadafc67dc7ec1e41671c56f040c7b6ed16280f50d')


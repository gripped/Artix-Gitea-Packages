# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Modified from extra/xdg-desktop-portal-kde; original contributors:
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=xdg-desktop-portal-lxqt
pkgver=1.3.0
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using Qt/KDE Frameworks/libfm-qt'
arch=(x86_64)
groups=(lxqt)
url='https://github.com/lxqt/xdg-desktop-portal-lxqt'
# https://github.com/lxqt/xdg-desktop-portal-lxqt/blob/1.0.2/LICENSE
# All C/C++ files include "any later"
license=('LGPL-2.1-or-later')
depends=(qt6-base kwindowsystem xdg-desktop-portal libfm-qt)
makedepends=(cmake)
provides=(xdg-desktop-portal-impl)
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('daa49490600ef3a3dbd9d1ccd94e72870f6c099ae425a1c2982e014555509775'
            'SKIP')
validpgpkeys=(
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

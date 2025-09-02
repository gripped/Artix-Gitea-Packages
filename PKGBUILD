# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sddm
pkgver=0.21.0
pkgrel=6
pkgdesc='QML based X11 and Wayland display manager'
arch=(x86_64)
url='https://github.com/sddm/sddm'
license=(GPL-2.0-only)
depends=(bash
         gcc-libs
         glibc
         libelogind
         libxau
         libxcb
         pam
         qt6-base
         qt6-declarative
         ttf-font
         x11win-server
         xorg-xauth)
makedepends=(extra-cmake-modules
             python-docutils
             qt5-base
             qt5-declarative
             qt5-tools
             qt6-tools)
optdepends=('qt5-declarative: for using Qt5 themes')
backup=('usr/share/sddm/scripts/Xsetup'
        'usr/share/sddm/scripts/Xstop'
        'etc/pam.d/sddm'
        'etc/pam.d/sddm-autologin'
        'etc/pam.d/sddm-greeter')
provides=(display-manager)
source=(https://github.com/$pkgname/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        sddm.{tmpfiles,sysusers})
sha256sums=('f895de2683627e969e4849dbfbbb2b500787481ca5ba0de6d6dfdae5f1549abf'
            'db625f2a3649d6d203e1e1b187a054d5c6263cadf7edd824774d8ace52219677'
            '9fce66f325d170c61caed57816f4bc72e9591df083e89da114a3bb16b0a0e60f')

build() {
  cmake -B build -S $pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
        -DBUILD_WITH_QT6=ON \
        -DDBUS_CONFIG_DIR=/usr/share/dbus-1/system.d \
        -DDBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
        -DBUILD_MAN_PAGES=ON \
        -DUSE_ELOGIND=yes \
        -DNO_SYSTEMD=yes \
        -DUID_MAX=60513
  cmake --build build

  cmake -B build5 -S $pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build5/src/greeter
  cmake --build build5/components
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  DESTDIR="$pkgdir" cmake --install build5/src/greeter
  DESTDIR="$pkgdir" cmake --install build5/components

  install -d "$pkgdir"/usr/lib/sddm/sddm.conf.d
  "$pkgdir"/usr/bin/sddm --example-config > "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
# Don't set PATH in sddm.conf
  sed -r 's|DefaultPath=.*|DefaultPath=/usr/local/sbin:/usr/local/bin:/usr/bin|g' -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
# Unset InputMethod https://github.com/sddm/sddm/issues/952
  sed -e "/^InputMethod/s/qtvirtualkeyboard//" -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf

  install -Dm644 sddm.sysusers "$pkgdir"/usr/lib/sysusers.d/sddm.conf
  install -Dm644 sddm.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/sddm.conf
}

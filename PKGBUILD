# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: tinywrkb <tinywrkb@gmail.com>

pkgname=power-profiles-daemon
pkgver=0.20
pkgrel=1
pkgdesc='Makes power profiles handling available over D-Bus'
url='https://gitlab.freedesktop.org/upower/power-profiles-daemon'
license=(GPL-3.0-only)
arch=(x86_64)
depends=(gcc-libs
         glib2
         glibc
         libgudev
         polkit
         upower)
optdepends=('python-gobject: for powerprofilesctl')
makedepends=(meson)
checkdepends=(python-dbusmock
              python-isort
              python-mccabe
              umockdev)
source=(https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
        power-profiles-daemon.tmpfiles)
        # drop patch for testing, eventually adopt for artix-service
        # dbus.patch)
sha256sums=('b6d3ad1cdcdc0324d5ccaa86dd0ed465544c1e86360fdbd2b6b2b0723afb6dad'
            'f6eeaf1b85f43c0a97480d1f1a578ef4a850850f66885ad9b6d90907df51ec1d')

# prepare() {
#   patch -d "$pkgname-$pkgver" -Np1 -i "${srcdir}"/dbus.patch
# }

build() {
  artix-meson "$pkgname-$pkgver" build \
    -Dsystemdsystemunitdir=''
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -vDm 644 "$srcdir/$pkgname".tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/"$pkgname".conf
}

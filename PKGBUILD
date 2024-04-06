# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: tinywrkb <tinywrkb@gmail.com>

pkgname=power-profiles-daemon
pkgver=0.21
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
        "$pkgname".tmpfiles
        dbus.patch)
sha256sums=('c15a368a59f2cae1474bdfccdd9357f06b0abc9eb7638a87f68c091aaf570349'
            'f6eeaf1b85f43c0a97480d1f1a578ef4a850850f66885ad9b6d90907df51ec1d'
            'a7da5c1272ab0bab2896025b500f43eec5923abdf5694a228f7ec541cf15ff37')

# prepare() {
#     patch -d "$pkgname-$pkgver" -Np 1 -i ../dbus.patch
# }

build() {
  local _meson_options=()
  _meson_options+=(
     -Dsystemdsystemunitdir=
     -Dpylint=disabled
     -Dmanpage=disabled
     -Dbashcomp=disabled
     --sysconfdir=/usr/share
  )
  artix-meson "$pkgname-$pkgver" build "${_meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -vDm 644 "$srcdir/$pkgname".tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/"$pkgname".conf
}

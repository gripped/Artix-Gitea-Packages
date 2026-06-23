# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=xdg-desktop-portal-wlr
pkgver=0.8.3
pkgrel=1
pkgdesc='xdg-desktop-portal backend for wlroots'
arch=('x86_64')
url="https://github.com/emersion/xdg-desktop-portal-wlr"
license=('MIT')
depends=(
  'glibc'
  'grim'
  'libdrm'
  'libinih'
  'libpipewire'
  'mesa'
  'pipewire'
  'pipewire-session-manager'
  'slurp'
  'libelogind'
  'wayland'
  'xdg-desktop-portal'
)
makedepends=(
  'meson'
  'scdoc'
  'wayland-protocols'
)
provides=('xdg-desktop-portal-impl')
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  wlr-portals.conf
)
sha512sums=('58b168df29f60b981830aba1663a3e4a1f482d0635e5eff12e212b24a259f2acd4547feb5a17ba1ce3364125817351b5d6849f8fc62401e06ed901fd59a42e16'
            '71f3383c3f62100dc669c519d107614a4566e808deddf66a179dd2bf175dc272a2390965cf38cd11dc4f0db0dc5cc7104712805034b9bced5874d62b03a579c2')

build() {
  cd "$pkgname-$pkgver"
  artix-meson -Dsystemd=disabled -Dsd-bus-provider=libelogind build
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # fix detection with x-d-p 1.18
  install -vDm644 -t "$pkgdir/usr/share/xdg-desktop-portal" "$srcdir/wlr-portals.conf"
}

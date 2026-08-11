# Maintainer: Nathan     <ndowens@artixlinux.org>
# Contributor: capezotte <capezotte@artixlinux.org>

pkgname=snooze
pkgver=0.6
pkgrel=1
pkgdesc="Run a command at a particular time"
arch=('x86_64')
url="https://github.com/leahneukirchen/snooze"
license=('CC0-1.0')
depends=(glibc)
makedepends=(git)
source=("git+${url}#tag=v${pkgver}")
sha512sums=('0775df43cdb352aef2c30d64b4491bedc028c5fc310145acdfc2f3051e40dbbfc5ea72ad214d9e0d614bb8b67ec409113d90696e5b3b40e3ff8ba70869de2136')

prepare() {
  cd "$pkgname"
  awk '/To the extent/,/1.0/ {print}' snooze.c > LICENSE
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/snooze
}

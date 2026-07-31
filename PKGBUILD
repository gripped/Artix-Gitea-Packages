# Maintainer: Nathan  <ndowens@artixlinux.org>
pkgname=snooze
pkgver=0.5.1
pkgrel=1
pkgdesc="Run a command at a particular time"
arch=('x86_64')
url="https://github.com/leahneukirchen/snooze"
license=('custom:CC0-1.0')
depends=("glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leahneukirchen/snooze/archive/v${pkgver}.tar.gz")
sha512sums=('6b97c691c1c34ec427032e27e7e9f9df8d68eae59e65b2acd777ac7416f18404b993812ba189257f4a418cfb8f8b5087e62c42bc276aeb4cae3b51acf262e9fd')

prepare() {
  cd "$pkgname-$pkgver"
  awk '/To the extent/,/1.0/ {print}' snooze.c > LICENSE
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/snooze
}

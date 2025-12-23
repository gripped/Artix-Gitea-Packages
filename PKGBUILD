# Maintainer: tuxce <tuxce.net@gmail.com>
# Maintainer: Igor <f2404@yandex.ru>
pkgname=package-query
pkgver=1.12.2
pkgrel=1.4
pkgdesc="Query ALPM and AUR"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/archlinuxfr/package-query"
license=('GPL')
depends=('pacman>=6.0' 'yajl>=2.0')
makedepends=('git')
source=('git+https://gitea.artixlinux.org/nous/package-query.git')
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure --localstatedir=/var --prefix=/usr \
              --sysconfdir=/etc --with-aur-url=https://aur.archlinux.org
  make
}

package () {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

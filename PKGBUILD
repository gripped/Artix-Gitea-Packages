# Maintainer: capezotte <capezotte@artixlinux.org>
# Based on AUR package by: Lazerbeak12345 <lazerbeak12345 at users dot noreply dot github dot com>

pkgname=s6-man-pages
pkgver=2.15.1.1.1
pkgrel=1
pkgdesc="Manual pages for ${pkgname%-man-pages}"
arch=('any')
url="https://git.sr.ht/~humm/${pkgname}"
license=('ISC')
groups=('skarnet-man-pages')
depends=()
makedepends=(git)
optdepends=("${pkgname%-man-pages}: package documented by these man pages")
source=("git+${url}#tag=v${pkgver}")
sha256sums=('5beb0e985aaaa80b5e16bf9ed91b6f54fa8bb3ad5e3c0b34c373e26301689652')

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

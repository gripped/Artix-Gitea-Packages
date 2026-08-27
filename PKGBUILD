# Maintainer: capezotte <capezotte@artixlinux.org>

pkgname=s6-man-pages
pkgver=2.15.0.0.1
pkgrel=1
pkgdesc="Manual pages for ${pkgname%-man-pages}"
arch=('any')
url="https://git.sr.ht/~humm/${pkgname}"
license=('ISC')
groups=('skarnet-man-pages')
depends=()
makedepends=(git)
optdepends=("${pkgname%-man-pages}: package documented by these man pages")
source=("git+https://git.sr.ht/~humm/${pkgname}#tag=v${pkgver}")
sha256sums=('ef67972a95975fc40c65167d2ac7b3012c3fc050bac753e0ce2d6bc807d127d7')

package() {
	cd "$pkgname"
	install -d -m 0755 $pkgdir/usr/share/man/man{7,8}
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


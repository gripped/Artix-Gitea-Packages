# Maintainer: capezotte <capezotte@artixlinux.org>

pkgname=s6-networking-man-pages
pkgver=2.8.0.0.1
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
sha256sums=('28c5f8b46aa0c98438dc7016468a0a9460c5fde31aacd5eded7986f1312d8f2f')

package() {
	cd "$pkgname"
	install -d -m 0755 "$pkgdir"/usr/share/man/man{7,8}
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


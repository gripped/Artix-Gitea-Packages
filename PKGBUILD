# Maintainer: capezotte <capezotte@artixlinux.org>

pkgname=s6-portable-utils-man-pages
pkgver=2.3.1.2.1
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
sha256sums=('b6b00bba244837871d00d1743a0e12c644ce959eb9ed97a7e163fc5c7e8a0f6e')

package() {
	cd "$pkgname"
	install -d -m 0755 "$pkgdir"/usr/share/man/man{7,8}
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


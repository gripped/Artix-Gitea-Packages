# Maintainer: capezotte <capezotte@artixlinux.org>
# Based on AUR package by: Lazerbeak12345 <lazerbeak12345 at users dot noreply dot github dot com>

pkgname=execline-man-pages
pkgver=2.10.0.0.1
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
sha256sums=('0e1650acd6f6899f4b6638d6d3e65348c26cfbbd730e0573c8b9bcf0dd6de1c8')

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

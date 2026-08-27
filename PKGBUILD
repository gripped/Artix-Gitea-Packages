# Maintainer: capezotte <capezotte@artixlinux.org>
# Based on AUR package by: Lazerbeak12345 <lazerbeak12345 at users dot noreply dot github dot com>

pkgname=s6-rc-man-pages
pkgver=0.6.1.1.1
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
sha256sums=('00f101873a8472835f3687b87fab955ae7dac610640fa36a5dee799ca204a6c6')

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

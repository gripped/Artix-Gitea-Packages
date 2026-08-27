# Maintainer: capezotte <capezotte@artixlinux.org>
# Based on AUR package by: Lazerbeak12345 <lazerbeak12345 at users dot noreply dot github dot com>

pkgname=execline-man-pages
pkgver=2.9.9.1.1
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
sha256sums=('0dfc32caa92a04a0409fd31be8e93a30d7d8bc9a7f4e033708afae8059deb884')

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# Maintainer: capezotte <capezotte@artixlinux.org>
# Based on AUR package by: Lazerbeak12345 <lazerbeak12345 at users dot noreply dot github dot com>

pkgname=s6-networking-man-pages
pkgver=2.8.0.1.1
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
sha256sums=('2ba616384aa6b7dfef3fd7df62cbff5e695965ebbcf8e87190e9ade38ff7c5c7')

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

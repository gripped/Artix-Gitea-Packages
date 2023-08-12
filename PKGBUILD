# Maintainer: Torr <torr@artixlinux.org>
pkgname=go-licenses
pkgver=1.6.0
pkgrel=1
pkgdesc="Lightweight tool to report on the licenses used by a Go package and its dependencies."
arch=("x86_64")
url="https://github.com/google/go-licenses"
license=("Apache2")
depends=("glibc")
makedepends=("go")
source=(
	"https://github.com/google/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
	"70c1ceb7c342ceb79b63a76caafb13ea3796a51715c742a482eb9d85277311e7"
)

build() {
	cd "$pkgname-$pkgver"
	export CGO_CFLAGS="$CFLAGS" CGO_LDFLAGS="$LDFLAGS"
	go build \
		-buildmode pie \
		-trimpath \
		-ldflags "-linkmode=external" \
		-mod readonly \
		-modcacherw \
		-buildvcs=false \
		-o $pkgname
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Torr <torr@artixlinux.org>
pkgname=senpai
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern terminal IRC client."
arch=("x86_64")
url="https://sr.ht/~taiite/senpai"
license=("MIT" "ISC")
depends=("glibc")
makedepends=("go" "gcc" "scdoc" "make")
source=(
	"https://git.sr.ht/~taiite/senpai/archive/v$pkgver.tar.gz"
)
sha256sums=(
	"9786fd83f3e1067549c3c88455a1f66ec66d993fe597cee334d217a5d1cf4803"
)

build() {
	cd "$pkgname-v$pkgver"
	export CGO_CFLAGS="$CFLAGS" CGO_LDFLAGS="$LDFLAGS" \
		GOPATH=/tmp/go GOCACHE=/tmp/go
	go build \
		-buildmode pie \
		-trimpath \
		-ldflags "-linkmode=external" \
		-mod readonly \
		-modcacherw \
		-buildvcs=false \
		-o $pkgname ./cmd/senpai
	make doc/senpai.1 doc/senpai.5
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	make install PREFIX="$pkgdir/usr"
}

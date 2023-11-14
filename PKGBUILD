# Maintainer: Torr <torr@artixlinux.org>
pkgname=github-cli
pkgver=2.39.0
pkgrel=1
pkgdesc="GitHub's official command line tool"
arch=("x86_64")
url="https://cli.github.com"
license=("MIT")
makedepends=(
	"go"
	"gcc"
	"make"
)
source=(
	"https://github.com/cli/cli/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
	"8edc9f25b11b8de6d573679c0ff69a2f8d6f48a2b0a1a79d70ceac4b5063cd74"
)

prepare() {
	cd "cli-$pkgver"
	sed -i "/^var Version/s/DEV/$pkgver/" internal/build/build.go
}

build() {
	cd "cli-$pkgver"
	export CGO_CFLAGS="$CFLAGS" CGO_LDFLAGS="$LDFLAGS" \
		GOPATH=/tmp/go GOCACHE=/tmp/go
	test ! -d bin && mkdir bin
	go build \
		-buildmode pie \
		-trimpath \
		-ldflags "-linkmode=external" \
		-mod readonly \
		-modcacherw \
		-o bin/gh cmd/gh/main.go

	make manpages completions
}

package() {
	cd "cli-$pkgver"
	make install DESTDIR="$pkgdir" prefix="/usr"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/gh"
}

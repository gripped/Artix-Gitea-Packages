pkgname=github-cli
pkgver=2.52.0
pkgrel=2
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
	"41de39d0f1bcacb454d9b8a46e5b97ff8b8e803cd26d284e553e45bf025325d9"
)

prepare() {
	cd "cli-$pkgver"
	sed -i "/^var Version/s/DEV/$pkgver/" internal/build/build.go
}

build() {
	cd "cli-$pkgver"
	export CGO_CFLAGS="$CFLAGS" CGO_LDFLAGS="$LDFLAGS" \
		GOPATH=/tmp/go GOCACHE=/tmp/go \
		GOTOOLCHAIN=local
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

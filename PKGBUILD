# Maintainer: Torr <torr@artixlinux.org>
pkgname=github-cli
pkgver=2.44.1
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
	"6254bbfbca8964e1f0f6631724e9c5f027637df0b4cd0998c4bdfec4554067e2"
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

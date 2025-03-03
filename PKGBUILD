# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=go-ethereum
pkgver=1.15.4
pkgrel=1
pkgdesc='Official Go implementation of the Ethereum protocol'
arch=('x86_64')
url='https://geth.ethereum.org/'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go')
provides=('geth')
conflicts=('geth')
replaces=('geth')
source=("git+https://github.com/ethereum/go-ethereum.git#tag=v${pkgver}"
        )
sha256sums=('26f7c16f188fc85b87db487695f57ee03ecfd4cbb3ed36e2e2a7b0beb4547516')

build() {
    cd ${pkgname}

    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie"
    make all
}

package() {
    cd ${pkgname}

    install -Dm755 -t "${pkgdir}"/usr/bin build/bin/*
    install -Dm644 build/deb/ethereum/completions/bash/geth -t "$pkgdir"/usr/share/bash-completion/completions
    install -Dm644 build/deb/ethereum/completions/zsh/_geth -t "$pkgdir"/usr/share/zsh/site-functions
}

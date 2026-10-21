# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=go-ethereum
pkgver=1.17.9
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
sha256sums=('f4fb30a25e0ca1d7c2f24dbe4dfa0451f4c6cc2691a093274916280260f07f7d')

build() {
    cd ${pkgname}

    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie"
    make all
}

package() {
    cd ${pkgname}

    install -Dm755 -t "${pkgdir}"/usr/bin build/bin/*
    install -Dm644 build/completions/bash/geth -t "$pkgdir"/usr/share/bash-completion/completions
    install -Dm644 build/completions/zsh/_geth -t "$pkgdir"/usr/share/zsh/site-functions
}

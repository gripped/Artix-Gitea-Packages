# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=go-ethereum
pkgver=1.13.15
_commit=c5ba367eb6232e3eddd7d6226bfd374449c63164
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
source=("git+https://github.com/ethereum/go-ethereum.git#commit=${_commit}")
sha256sums=('1ff9f7c30cd823259343b6e391d8cd7ae5b6a35136863edc661fa47361fadc78')

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

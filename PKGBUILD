# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=go-ethereum
pkgver=1.15.11
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
sha256sums=('8ec16452878d76c7e3c87aa46ddb95dfc34b023aa20ab211b58be2868d653072')

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

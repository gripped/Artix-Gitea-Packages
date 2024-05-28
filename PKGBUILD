# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=go-ethereum
pkgver=1.14.3
_commit=ab48ba42f4f34873d65fd1737fabac5c680baff6
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
sha256sums=('753f3838bc9a1458eb7cb7120e286eaf79ca7637bf2fe382be885297daa91d6d')

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

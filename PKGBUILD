# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=go-ethereum
pkgver=1.13.4
_commit=3f907d6a6f6de09cff1360ed529126765939851d
pkgrel=1
pkgdesc='Official Go implementation of the Ethereum protocol'
arch=('x86_64')
url='https://geth.ethereum.org/'
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
provides=('geth')
conflicts=('geth')
replaces=('geth')
source=("git+https://github.com/ethereum/go-ethereum.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd ${pkgname}

    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie"
    make all
}

package() {
    cd ${pkgname}

    install -Dm755 -t "${pkgdir}"/usr/bin build/bin/*
}

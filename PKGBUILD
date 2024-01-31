# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=go-ethereum
pkgver=1.13.11
_commit=8f7eb9ccd99ee47721a7bfde494d6da28de4cd8e
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

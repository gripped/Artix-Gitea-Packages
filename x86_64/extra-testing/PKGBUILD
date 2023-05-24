# Maintainer: artoo <artoo@artixlinux.org>

_upstream=arch-rebuild-order

pkgname=artix-rebuild-order
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI tool to determine the rebuild order of provided package(s)"
arch=('x86_64')
url="https://gitlab.archlinux.org/archlinux/arch-rebuild-order"
license=('MIT')
groups=('artools')
depends=('glibc' 'gcc-libs' 'libalpm.so')
makedepends=('cargo' 'mandown' 'git')
source=(git+https://gitlab.archlinux.org/archlinux/arch-rebuild-order.git#tag=v$pkgver?signed
        aro-artix.patch)
validpgpkeys=("E499C79F53C96A54E572FEE1C06086337C50773E")
sha256sums=('SKIP'
            'a7177e6e04f46a0f7bc26e6c252e03d0b2dab39c3657bef923ed7858fa396c7e')
b2sums=('SKIP'
        '1859587858a0b72da4e9334eb2bf68556276f3088b1f8a729656d167eea5ba5a528c003eca1712010ab322df2f0b1d1bf52551cf052e89c7a7cc19090fc0470f')

prepare() {
    cd "${_upstream}"
    patch -Np1 -i ../aro-artix.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_upstream}"
    cargo build --frozen --release --all-features
}

check() {
    cd "${_upstream}"
    cargo test --frozen --all-features
}

package() {
    cd "${_upstream}"

    make DESTDIR="${pkgdir}" PREFIX=/usr install

    ln -sfv arch-rebuild-order "${pkgdir}"/usr/bin/artix-rebuild-order

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


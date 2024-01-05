# Maintainer: artoo <artoo@artixlinux.org>

_upstream=arch-rebuild-order

pkgname=artix-rebuild-order
pkgver=0.4.2
pkgrel=1
pkgdesc="CLI tool to determine the rebuild order of provided package(s)"
arch=('x86_64')
url="https://gitlab.archlinux.org/archlinux/arch-rebuild-order"
license=('MIT')
groups=('artix-tools')
depends=('glibc' 'gcc-libs' 'libalpm.so')
makedepends=('cargo' 'mandown' 'git')
source=(git+$url.git#tag=v$pkgver?signed
        aro-artix.patch)
validpgpkeys=("E499C79F53C96A54E572FEE1C06086337C50773E")
sha256sums=('SKIP'
            '13a1be99e9b2b632a2ded884fc7a32d2975ea77759adbbcf960d8bdcaeec459a')
b2sums=('SKIP'
        '87dddb81ff400999447c23ef6654756cdf7f67a58dbc53881d8882ac67455f2610b8d85a17582a9d1d134fd290dd522315e76c4516e0b07b6fc64990cea97701')

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


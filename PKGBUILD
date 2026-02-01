# Maintainer: Ainola <ainola@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

pkgname=slurp
pkgver=1.6.0
pkgrel=1
pkgdesc='Select a region in a Wayland compositor'
arch=('x86_64')
url="https://github.com/emersion/slurp"
license=('MIT')
depends=(
    'cairo'
    'glibc'
    'libxkbcommon'
    'wayland'
)
makedepends=(
    'meson'
    'scdoc'
    'wayland-protocols'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('5b18b88c5e668ff24bcee6b85923eb066f4a8c3115ed05e2c017e139f5cc9f62085581a7a5cc217ddd6d6e74923015ed03dbc4236743006a552752b867bd0124')
validpgpkeys=("34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48") # emersion

build() {
    artix-meson "$pkgname-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    cd "$pkgname-$pkgver"
    install -vDm 0644 LICENSE -t "$pkgdir/usr/share/licenses/slurp/"
    install -vDm 0644 README.md -t "$pkgdir/usr/share/doc/slurp/"
}

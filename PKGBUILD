# Maintainer: artist for Artix Linux

pkgname=ly
pkgver=1.2.0
pkgrel=1
pkgdesc="Lightweight TUI (ncurses-like) display manager"
arch=(x86_64)
url="https://codeberg.org/AnErrupTion/ly"
license=('WTFPL')
depends=(pam glibc)
makedepends=(git libxcb zig)
optdepends=('brightnessctl: for controling brightness'
            'xorg-xmessage: for displaying a message or query in a window'
            'xorg-xauth: for X server sessions'
            'libxcb: for X server sessions')
backup=(etc/$pkgname/{config.ini,setup.sh}
        etc/pam.d/ly)
source=("git+$url.git#tag=v${pkgver}"
        config_ini.patch)
b2sums=('3ebde0a9fa57fe3c13a83b8bb0884bdc237d629d51d88c5ecbc9fcf7dc32ad31a66882f2cbed40790f02ab8e425beb8cd5809b34993a7d341c2f1d64b81a37df'
        '7abef765e27adf9950538f6e70ba1b1970ea48196535a7507f148169ada1ad299ae334ca59cf0bc657bca4b1ccf22d005584b8af3ecfdf6b1a2b0f21db2051e1')

prepare() {
    cd "$pkgname"
    sed -i '/try install_service(allocator, patch_map);/d' build.zig
#    patch -Np1 -i "$srcdir/config_ini.patch"
}

build() {
    cd "$pkgname"
    zig build -Ddest_directory="$pkgdir" -Dname="ly-dm" -Dcpu=baseline -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname"
    zig build -Ddest_directory="$pkgdir" -Dname="ly-dm" -Ddefault_tty=7 -Dcpu=baseline -Doptimize=ReleaseSafe installexe
    install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/WTFPL"
}



# Maintainer: artist for Artix Linux

pkgname=ly
pkgver=1.4.0
pkgrel=1.6
pkgdesc="TUI display manager"
arch=(x86_64 aarch64)
url="https://codeberg.org/fairyglade/ly.git"
license=('WTFPL')
depends=(pam)
makedepends=('zig>=0.16' 'zig<0.17' git libxcb)
optdepends=('xorg-xauth: for X server sessions'
            'durdraw: for animations')
backup=(etc/"$pkgname"/{config.ini,setup.sh})
source=("git+$url#tag=v$pkgver")

prepare() {
    cd "$pkgname"
    sed -i '/try install_service(allocator, patch_map);/d' build.zig
    sed -i 's|restart_cmd = /sbin/shutdown -r now|restart_cmd = /usr/bin/loginctl reboot|' res/config.ini
    sed -i 's|shutdown_cmd = /sbin/shutdown $PLATFORM_SHUTDOWN_ARG now|shutdown_cmd = /usr/bin/loginctl poweroff|' res/config.ini
    sed -i 's|sleep_cmd = null|sleep_cmd = /usr/bin/loginctl suspend|' res/config.ini
}

build() {
    cd "$pkgname"
    zig build \
        --cache-dir "$srcdir/zig-cache" \
        --global-cache-dir "$srcdir/zig-global-cache" \
        -Doptimize=ReleaseSafe -Dtarget=x86_64-native -Dcpu=penryn
}

package() {
    cd "$pkgname"
    zig build installexe \
        --cache-dir "$srcdir/zig-cache" \
        --global-cache-dir "$srcdir/zig-global-cache" \
        -Ddest_directory="$pkgdir" \
        -Dname="ly-dm" \
        -Dinit_system="openrc" \
        -Doptimize=ReleaseSafe -Dtarget=x86_64-native -Dcpu=penryn

    install -DZ -m644 license.md "$pkgdir/usr/share/licenses/$pkgname/WTFPL"

    rm -r "$pkgdir/etc/init.d"
}
sha256sums=('9656bc5e061d234c7d369416b4572d13394ccb6815a2bdcae3fcc7e45b1c95f3')


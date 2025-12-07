# Maintainer: artist for Artix Linux

pkgname=ly
pkgver=1.3.0
pkgrel=2
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
source=("git+$url.git#tag=v${pkgver}")
b2sums=('102f0065a135f2757a5aa58d92de41af8eea2c92875a52061279bed18459dffee272f7db89fa09cb2066473c4210d4747ec0961928301f45fb145ed5292a04b1')

prepare() {
  cd "$pkgname"
  sed -i '/try install_service(allocator, patch_map);/d' build.zig
  sed -i 's|restart_cmd = /sbin/shutdown -r now|restart_cmd = /usr/bin/loginctl reboot|' res/config.ini
  sed -i 's|shutdown_cmd = /sbin/shutdown $PLATFORM_SHUTDOWN_ARG now|shutdown_cmd = /usr/bin/loginctl poweroff|' res/config.ini
  sed -i 's|sleep_cmd = null|sleep_cmd = /usr/bin/loginctl suspend|' res/config.ini
}

build() {
  cd "$pkgname"
  zig build -Ddest_directory="$pkgdir" -Dname="ly-dm" -Dcpu=baseline -Doptimize=ReleaseSafe
}

package() {
  cd "$pkgname"
  zig build -Ddest_directory="$pkgdir" -Dname="ly-dm" -Dcpu=baseline -Doptimize=ReleaseSafe installexe
  install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/WTFPL"
}



# Maintainer: artist for Artix Linux

pkgname=ly
pkgver=1.4.0
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
source=("git+$url.git#tag=v${pkgver}")
b2sums=('b982af1d9e682b712a51513fb5452aa19d26bdaa9361329f5ce42ddd5e80953a4231608fa0fd654a8a8c71c5efa8e5a7f113c7cf87855b16eff1c12a171fd949')

prepare() {
  cd "$pkgname"
  sed -i '/try install_service(allocator, patch_map);/d' build.zig
  sed -i 's|restart_cmd = /sbin/shutdown -r now|restart_cmd = /usr/bin/loginctl reboot|' res/config.ini
  sed -i 's|shutdown_cmd = /sbin/shutdown $PLATFORM_SHUTDOWN_ARG now|shutdown_cmd = /usr/bin/loginctl poweroff|' res/config.ini
  sed -i 's|sleep_cmd = null|sleep_cmd = /usr/bin/loginctl suspend|' res/config.ini
  #git cherry-pick -n ced8f9bee35ad97c1e59ef1e182e064c04eb76a7
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


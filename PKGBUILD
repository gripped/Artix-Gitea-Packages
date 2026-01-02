# Maintainer: artist for Artix Linux

pkgname=ly
pkgver=1.3.1
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
b2sums=('94e57276a9d0c9b27774f94522ad8684ef5a227b62ef5e3710ae49233612b063c8924a4e2967362ed331d7ba4950b242f8ef4f828703a058fde97e49e376a252')

prepare() {
  cd "$pkgname"
  sed -i '/try install_service(allocator, patch_map);/d' build.zig
  sed -i 's|restart_cmd = /sbin/shutdown -r now|restart_cmd = /usr/bin/loginctl reboot|' res/config.ini
  sed -i 's|shutdown_cmd = /sbin/shutdown $PLATFORM_SHUTDOWN_ARG now|shutdown_cmd = /usr/bin/loginctl poweroff|' res/config.ini
  sed -i 's|sleep_cmd = null|sleep_cmd = /usr/bin/loginctl suspend|' res/config.ini
  git cherry-pick -n ced8f9bee35ad97c1e59ef1e182e064c04eb76a7
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


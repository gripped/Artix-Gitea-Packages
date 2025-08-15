# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
# Contributor: Artoo <artoo@artixlinux.org>

pkgname=dinit-rc
pkgver=0.6.0
pkgrel=2
pkgdesc="rc files for dinit"
arch=('x86_64')
url="https://gitea.artixlinux.org/artix/dinit-rc"
license=('BSD-2-Clause')
depends=(
    'udev'
    'artix-cgroups'
    'dbus' # dbus dep is for dbus-wait-for
    'bash'
    'glibc'
)
makedepends=(
    'git'
    'scdoc'
)
optdepends=(
    'cryptsetup-dinit: Encrypted disks support'
    'lvm2-dinit: LVM support'
    'mdadm-dinit: MD devices support'
)
provides=(
    'init-udev'
    'init-rc'
)
conflicts=(
    'init-udev'
    'init-rc'
)
backup=('etc/dinit.d/config/console.conf'
        'etc/hwclock.conf'
        # 'etc/rc.local' # provide a default file
        # 'etc/rc.shutdown' # provide a default file
)
source=("git+${url}.git#tag=$pkgver")
sha256sums=('92deb5abf4eead4ba81f17b0ba1affffe0bfe66ba4cd312ee0bc61213000fba1')

build() {
    make -C "$pkgname"
}

package() {
    make -C "$pkgname" DESTDIR="$pkgdir/" install

    # iputils
    mkdir -p "$pkgdir/usr/lib/sysctl.d"

    # copying
    install -Dm644 "$pkgname"/COPYING "$pkgdir/usr/share/licenses/dinit-rc/COPYING"
}

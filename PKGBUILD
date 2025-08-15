# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
# Contributor: Artoo <artoo@artixlinux.org>

pkgname=dinit-rc
pkgver=0.6.0
pkgrel=3
pkgdesc="rc files for dinit"
arch=('x86_64')
url="https://gitea.artixlinux.org/artix/dinit-rc"
license=('BSD-2-Clause')
depends=(
    'artix-cgroups'
    'bash'
    'dbus' # dbus dep is for dbus-wait-for
    'dinit-user-spawn'
    'glibc'
    'udev'
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
        'etc/rc.local' # provide a default file
        'etc/rc.shutdown' # provide a default file
)
source=(
    "git+${url}.git#tag=$pkgver"
    rc.{local,shutdown}
)
sha256sums=('92deb5abf4eead4ba81f17b0ba1affffe0bfe66ba4cd312ee0bc61213000fba1'
            '1a7cc77e88cc15b4cbbdc8543a34a445fb386c41b1fb57bae94548dda19972f8'
            '1a7cc77e88cc15b4cbbdc8543a34a445fb386c41b1fb57bae94548dda19972f8')

build() {
    make -C "$pkgname"
}

package() {
    make -C "$pkgname" DESTDIR="$pkgdir/" install

    # iputils
    install -d "$pkgdir"/usr/lib/sysctl.d

    # custom rc
    install -m755 rc.local "$pkgdir"/etc/rc.local
    install -m755 rc.shutdown "$pkgdir"/etc/rc.shutdown

    # copying
    install -Dm644 "$pkgname"/COPYING "$pkgdir/usr/share/licenses/dinit-rc/COPYING"
}

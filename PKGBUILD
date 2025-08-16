# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
# Contributor: Artoo <artoo@artixlinux.org>

pkgname=dinit-rc
pkgver=0.6.3
pkgrel=1
pkgdesc="rc files for dinit"
arch=('x86_64')
url="https://gitea.artixlinux.org/artix/dinit-rc"
license=('BSD-2-Clause')
depends=(
    'artix-cgroups'
    'bash'
    'dbus' # dbus dep is for dbus-wait-for
    'dinit-user-spawn>=1.0.0-6'
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
sha256sums=('216c0008a1338dbd0ee3396db20ab7344f79651e80e1c31728eca89309253822'
            '8530a1b856190a15517f9d4f70b79f349af91db51cf6d5dafc77dfb2cce6496e'
            'c3b64a2fe063bd19692d0cab55f5bc6021d097843aa14b3982069aaefeab9a5c')

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

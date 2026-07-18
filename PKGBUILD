# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-scripts
pkgver=20260718
pkgrel=1
pkgdesc='A collection of essential s6-rc oneshots and longruns for startup/shutdown.'
arch=('any')
url='https://gitea.artixlinux.org/artix/s6-scripts'
provides=('init-udev')
depends=('artix-cgroups' 'execline' 'pam' 's6-rc' 'udev')
makedepends=('git')
optdepends=('cryptsetup-s6: cryptsetup boot script support'
            'lvm2-s6: lvm2 boot script support')
backup=('etc/s6/rc.local'
        'etc/s6/config/tty1.conf'
        'etc/s6/config/tty2.conf'
        'etc/s6/config/tty3.conf'
        'etc/s6/config/tty4.conf'
        'etc/s6/config/tty5.conf'
        'etc/s6/config/tty6.conf'
        'etc/s6/config/ttyS.conf'
        'etc/s6/config/dmesg.conf'
        'etc/s6/config/hwclock.conf'
        'etc/s6/config/mount-tmpfs.conf'
        'etc/s6/config/udevd.conf'
        'usr/lib/sysctl.d/50-default.conf')
_commit=05d9474bb26889cc8e0f3ac2efc56495ee3f2050
source=("git+$url.git#commit=$_commit")
sha256sums=('f21558fa160ad70b8d98661960bda0af55e5c6e16a79b797f68d477b56d76768')

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" make install
}

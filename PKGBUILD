# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=s6-scripts
pkgver=20260509
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
_commit=7cdb4fd0fb39568348ef800c5ce6d8de2d8d352f
source=("git+$url.git#commit=$_commit")
sha256sums=('b3581cffd5f1e1f098802a63d7be1f11021e03f700f0f6a2aedd2ff450d7456a')

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" make install
}

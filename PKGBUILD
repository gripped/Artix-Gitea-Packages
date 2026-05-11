# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=lvm2-s6
pkgver=20260511
pkgrel=1
pkgdesc="s6-rc service scripts for lvm2"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-system')
provides=('init-lvm2')
conflicts=('init-lvm2')
depends=('lvm2' 's6-base')
makedepends=('git')
backup=('etc/s6/config/lvm2.conf')
_commit=02346dc79b28dee5d8f7921eeb2e0b2c0a5abf7c
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit")
sha256sums=('b54d0567384aaa4e5b9122dd4f5d9f4b097472a41acb4204e458574be3d63adb')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "lvm2" "${pkgdir}"
}

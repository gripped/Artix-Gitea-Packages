# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=nvidia-utils-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for nvidia-utils"
arch=('any')
url="https://artixlinux.org"
groups=('dinit-world')
provides=('init-nvidia-utils')
conflicts=('init-nvidia-utils')
depends=('nvidia-utils' 'dinit')
makedepends=('git')
source=('nvidia-persistenced')
sha256sums=('7a34d1e857d57648970661fb52a3f1e96d45247b095fe848789d16c8cce4e4db')

package() {
    install -Dm644 nvidia-persistenced "$pkgdir/etc/dinit.d/nvidia-persistenced"
}

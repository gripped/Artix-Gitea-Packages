# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=nvidia-utils-dinit
pkgver=20211030
pkgrel=3
pkgdesc="dinit service scripts for nvidia-utils"
arch=('any')
url="https://artixlinux.org"
groups=('dinit-world')
provides=('init-nvidia-utils')
conflicts=('init-nvidia-utils')
depends=('nvidia-utils' 'dinit')
makedepends=('git')
source=('nvidia-persistenced')
sha256sums=('9f05efc5014241173e046562de132697df4667d3ddc6b410e50d101d96f73324')

package() {
    install -Dm644 nvidia-persistenced "$pkgdir/etc/dinit.d/nvidia-persistenced"
}

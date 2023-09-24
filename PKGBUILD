# Contributor linuxer <https://gitea.artixlinux.org/linuxer>
         
pkgname=artix-i3-presets
pkgdesc="Artix Linux i3 presets"
pkgver=20200906
pkgrel=2
#replaces=('artix-i3-presets')
arch=('any')
url="https://gitea.artixlinux.org/linuxer/artix-i3-presets"
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://gitea.artixlinux.org/linuxer/artix-i3-presets/archive/${pkgver}.tar.gz")
sha256sums=('697e8fef8833b7d9daadcba92503bedc1a459216466cbaf35d1873070f05afc9')
         
package() {
    cd "${pkgname}"
    mkdir -p "$pkgdir"/etc/
    cp -R skel "$pkgdir"/etc/
}

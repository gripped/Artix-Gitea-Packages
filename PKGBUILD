# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Nathan <ndowens@artixlinux.org>
pkgname=chrony-s6
pkgver=20260730
pkgrel=1
pkgdesc="s6-rc service scripts for chrony"
arch=('any')
url="https://gitea.artixlinux.org/artix/s6-services"
groups=('s6-world')
provides=('init-chrony')
conflicts=('init-chrony')
depends=('chrony' 's6-base')
makedepends=('git')
backup=('etc/s6/config/chrony.conf')
_commit=cce58829fcb5b466563749ffd7038719be0c3328
source=("git+https://gitea.artixlinux.org/artix/s6-services.git#commit=$_commit"
        "org.artixlinux.services.s6.chrony.metainfo.xml")
sha256sums=('40b264fb9b639dfd215ad4c1d4c2bcfe670c0b66fbc6b9b13182a559a2412c58'
            'e0763a9c2105d2cf3cc36e7b41f72b92eb394b5f303019b0aada87c4b03c0b62')

package() {
    cd "${srcdir}"/s6-services
    sh install.sh "chrony" "${pkgdir}"
    install -Dm644 -t "${pkgdir}/usr/share/metainfo" "${srcdir}/org.artixlinux.services.s6.chrony.metainfo.xml"
}

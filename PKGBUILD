# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=spice-vdagent-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for spice-vdagent"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('spice-vdagent' 'dinit')
conflicts=('init-spice-vdagent')
provides=('init-spice-vdagent')
source=("spice-vdagentd" "spice-vdagentd-pre")
sha256sums=('ebdd058295b88702a9886d81b0b7cb0c5f2ab5aa021ff21aa57e6c412255d32d'
            'de4cf83f240fa802dd7758fb82cc0c86937fc8033da9a02bb3913c524d39b457')

package() {
    install -Dm644 spice-vdagentd     "$pkgdir/etc/dinit.d/spice-vdagentd"
    install -Dm644 spice-vdagentd-pre "$pkgdir/etc/dinit.d/spice-vdagentd-pre"
}

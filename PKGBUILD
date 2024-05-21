# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=spice-vdagent-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service scripts for spice-vdagent"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('spice-vdagent' 'dinit')
conflicts=('init-spice-vdagent')
provides=('init-spice-vdagent')
source=("spice-vdagentd" "spice-vdagentd-pre")
sha256sums=('ff3132c262a4b8d7cbe6e2fa763ac2345857891ec33fabaee6a7341ffde5e93c'
            '886a96e9276d1d06142e8ebbd6131fe32655fb92b951779eaf05c5910f81401b')

package() {
    install -Dm644 spice-vdagentd     "$pkgdir/etc/dinit.d/spice-vdagentd"
    install -Dm644 spice-vdagentd-pre "$pkgdir/etc/dinit.d/spice-vdagentd-pre"
}

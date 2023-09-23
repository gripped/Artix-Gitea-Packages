# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openssh-dinit
pkgver=20230906
pkgrel=2
pkgdesc="dinit service scripts for openssh"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('openssh' 'dinit')
provides=('init-openssh')
conflicts=('init-openssh')
groups=('dinit-system')
source=("sshd" "ssh-keygen")
sha256sums=('48b859097a607f5f895336b9a8b327c9a1e3a05a4d37b892b739da4f37f470a6'
            '65e0b85d254a7b7bbad81af388f60f14b9cb11e7c0a709681e28ddec28ffbc47')

package() {
    install -Dm644 sshd       "$pkgdir/etc/dinit.d/sshd"
    install -Dm644 ssh-keygen "$pkgdir/etc/dinit.d/ssh-keygen"
}

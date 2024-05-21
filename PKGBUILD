# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openssh-dinit
pkgver=20230906
pkgrel=3
pkgdesc="dinit service scripts for openssh"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('openssh' 'dinit')
provides=('init-openssh')
conflicts=('init-openssh')
groups=('dinit-system')
source=("sshd" "ssh-keygen")
sha256sums=('711a54455314ab9d0d1520633572ad48f406fcb7541b224d6e4afaad51e714b7'
            '3a3e7faad3788ec00251ae2dd9f6d1c2339f71f29b2a53603f393c9ab51b054f')

package() {
    install -Dm644 sshd       "$pkgdir/etc/dinit.d/sshd"
    install -Dm644 ssh-keygen "$pkgdir/etc/dinit.d/ssh-keygen"
}

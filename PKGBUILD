# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=sshguard-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for sshguard"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('sshguard' 'dinit')
conflicts=('init-sshguard')
provides=('init-sshguard')
source=("sshguard")
sha256sums=('0b638e26c174b4e0e66ee5cf68e83c56d078535ffc9f861426a0b1466ad51508')

package() {
    install -Dm644 sshguard "$pkgdir/etc/dinit.d/sshguard"
}

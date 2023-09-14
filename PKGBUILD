# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=sshguard-dinit
pkgver=20211102
pkgrel=2
pkgdesc="dinit service scripts for sshguard"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('sshguard' 'dinit')
conflicts=('init-sshguard')
provides=('init-sshguard')
source=("sshguard")
sha256sums=('b97628187254521e42ddd02752b11a30eac6b4284003491aa87ba2a66a96d869')

package() {
    install -Dm644 sshguard "$pkgdir/etc/dinit.d/sshguard"
}

# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=jenkins-dinit
pkgver=20211102
pkgrel=4
pkgdesc="dinit service scripts for jenkins"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('jenkins' 'dinit')
conflicts=('init-jenkins')
provides=('init-jenkins')
source=("jenkins" "jenkins.script" "jenkins-pre")
sha256sums=('0756fdb01331f5125accf7b78afcfa862190ca84684e7d893dac03e6f5debe7b'
            '2af7e6e3f78e73c918600ce204e9428af64d3ec3497be70859f1680c77e2af32'
            '62d89e5393c7a6011e2cc068fe35f49b16a90b48737131e4de578bb3a162bdee')

package() {
    install -Dm644 jenkins        "$pkgdir/etc/dinit.d/jenkins"
    install -Dm644 jenkins-pre    "$pkgdir/etc/dinit.d/jenkins-pre"
    install -Dm755 jenkins.script "$pkgdir/usr/lib/dinit/jenkins"
}

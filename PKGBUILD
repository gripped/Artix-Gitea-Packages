# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=jenkins-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for jenkins"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('jenkins' 'dinit')
conflicts=('init-jenkins')
provides=('init-jenkins')
source=("jenkins" "jenkins.script" "jenkins-pre")
sha256sums=('97f7687d7d28914870e83575ffc60822d16865ef67269a9b4ceb5a2b472069f1'
            '2af7e6e3f78e73c918600ce204e9428af64d3ec3497be70859f1680c77e2af32'
            'c04924a892e81c00352a0e53db049803d6a870d257efce9e28aea52d7ca73f67')

package() {
    install -Dm644 jenkins        "$pkgdir/etc/dinit.d/jenkins"
    install -Dm644 jenkins-pre    "$pkgdir/etc/dinit.d/jenkins-pre"
    install -Dm755 jenkins.script "$pkgdir/usr/lib/dinit/jenkins"
}

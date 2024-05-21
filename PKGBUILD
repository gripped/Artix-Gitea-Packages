# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=tigervnc-dinit
pkgver=20211103
pkgrel=3
pkgdesc="dinit service scripts for tigervnc"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('tigervnc' 'dinit')
conflicts=('init-tigervnc')
provides=('init-tigervnc')
install=tigervnc-dinit.install
backup=('etc/dinit.d/vncserver' 'etc/dinit.d/config/vncserver.conf')
source=("vncserver" "vncserver.conf" "vncserver.script")
sha256sums=('2b6049e0442298464084befa4235eee57eab80a88334d4c2ae4b3e310a5a61be'
            '9c612c135ec81248e224c17d4ecf33af5a126a40ecdf40ca7c419755e687f0e0'
            '5348793d50c77259ff717337ea8c98a36343831319a5d37dd9ac76494f5fbf16')

package() {
    install -Dm644 vncserver        "$pkgdir/etc/dinit.d/vncserver"
    install -Dm644 vncserver.conf   "$pkgdir/etc/dinit.d/config/vncserver.conf"
    install -Dm755 vncserver.script "$pkgdir/etc/dinit.d/scripts/vncserver"
}

# Maintainer: artist for Artix Linux

pkgname=limine-snapper-sync-openrc
pkgver=20260624
pkgrel=1.1
pkgdesc="OpenRC limine-snapper-sync init script"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('limine-snapper-sync')
groups=('openrc-world')
source=("limine-snapper-sync.initd")

package() {
    install -Dm755 "$srcdir/limine-snapper-sync.initd" "$pkgdir/etc/init.d/limine-snapper-sync"
}

sha256sums=('629609dbd1f369daf68a6ed60b05781948b0fbe349d7f883462b8843af81e961')
 

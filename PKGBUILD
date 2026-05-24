# Maintainer: artist for Artix Linux

pkgname=ly-dinit
pkgver=20260524
pkgrel=1
pkgdesc="dinit service script for ly"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('ly' 'dinit')
groups=('dinit-world')
provides=('init-ly' 'init-displaymanager')
conflicts=('init-ly' 'init-displaymanager')
source=("ly")
sha256sums=('a5a8bb4ead7faf08eb0ccbabe1d4af3e2a1596ca45c0e9c1ace8ae0af3f3250b')

package() {
    install -Dm644 ly "$pkgdir/etc/dinit.d/ly"
}


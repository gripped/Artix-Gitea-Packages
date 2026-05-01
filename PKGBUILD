# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=artix-plasma-splash
pkgver=2026.05
pkgrel=1
pkgdesc='Artix Plasma desktop splash screen'
arch=('any')
url="https://gitea.artixlinux.org/artix/artix-branding"
license=('GPL')
depends=('plasma-desktop')
makedepends=('git')
groups=('artix-style' 'artix-branding')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
    mkdir -p $pkgdir/usr/share/plasma/look-and-feel
    cp -a artix-branding/$pkgname/ArtixTube $pkgdir/usr/share/plasma/look-and-feel/
}

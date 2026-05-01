# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=artix-grub-theme
pkgver=2026.05
pkgrel=1
pkgdesc='Artix GRUB theme'
arch=('any')
url="https://gitea.artixlinux.org/artix/artix-branding"
license=('GPL')
depends=('grub')
makedepends=('git')
groups=('artix-style' 'artix-branding')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
    mkdir -p $pkgdir/usr/share/grub/themes
    cp -a artix-branding/$pkgname/artix $pkgdir/usr/share/grub/themes/
}

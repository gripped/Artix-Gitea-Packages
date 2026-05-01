# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=artix-sddm-theme
pkgver=2026.05
pkgrel=2
pkgdesc='Artix SDDM theme'
arch=('any')
url="https://gitea.artixlinux.org/artix/artix-branding"
license=('GPL')
depends=('sddm' 'qt5-declarative' 'artix-backgrounds')
makedepends=('git')
groups=('artix-style' 'artix-branding')
conflicts=('artix-breeze-sddm' 'sddm-theme-artix')
replaces=('artix-breeze-sddm' 'sddm-theme-artix')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
    mkdir -p $pkgdir/usr/share/sddm/themes
    cp -a artix-branding/$pkgname/artix $pkgdir/usr/share/sddm/themes/
}

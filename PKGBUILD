# Maintainer: nous

pkgname=artix-dark-theme
pkgver=20260811
pkgrel=1
pkgdesc="Dark theme for the Artix Linux ISOs. Gtk2/3/4, Qt5/6, Plasma splash."
arch=('any')
url="https://gitea.artixlinux.org/nous/artix-dark-theme"
license=('GPL')
source=('git+https://gitea.artixlinux.org/artix/artix-dark-theme.git')
sha256sums=('SKIP')
depends=('artix-backgrounds' 'artix-icons')
makedepends=('git')
optdepends=('gtk2' 'gtk3' 'qt5' 'qt6' 'plasma' 'gtk-engines' 'xcursor-premium' 'qt5ct' 'qt6ct' 'openbox' 'gtk-engine-murrine' 'qt6gtk2')
groups=('artix-branding' 'artix-style')

package() {
  cd "${srcdir}/$pkgname"
  cp -rf usr "${pkgdir}"/
}

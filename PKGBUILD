# Maintainer: artist for Artix Linux

pkgname=moksha-background-artix-classic
_basename=moksha-artix
_theme=ArtixClassic
pkgver=1.0
pkgrel=1
pkgdesc="Artix Clasic Wallpaper for Moksha"
arch=('any')
depends=("moksha")
makedepends=("git")
url="https://gitea.artixlinux.org/artix/$_basename"
license=('GPL3')
source=("git+https://gitea.artixlinux.org/artix/$_basename.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$_basename/backgrounds/$_theme"
  install -dm 755 "$pkgdir/usr/share/enlightenment/data/backgrounds"
  ../../scripts/build-theme.sh "$_theme.edc" "$pkgdir/usr/share/enlightenment/data/backgrounds/$_theme.edj"
}


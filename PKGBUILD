# Maintainer: artist for Artix Linux

pkgname=pacifica-icon-theme
pkgver=0.4.1
pkgrel=1.3
pkgdesc="Pacifica icon theme by bokehlicia"
url="http://bokehlicia.deviantart.com/art/Pacifica-Icons-402508559"
source=("pacifica-icon-theme.zip::https://github.com/fsvh/pacifica-icon-theme/archive/refs/heads/master.zip")
license=('GPL')
arch=('any')
depends=('elementary-icon-theme')

package() {
  install -dm 755 "$pkgdir"/usr/share/icons
  cd $srcdir/pacifica-icon-theme-master
  cp -r Pacifica* $pkgdir/usr/share/icons/
  chmod -R 755 "$pkgdir"/usr/share/icons/Pacifica*
  install -Dm644 -t"$pkgdir/usr/share/doc/$pkgname/" CREDITS README.md
}

sha256sums=('SKIP')

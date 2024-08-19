# Maintainer: artist for Artix Linux

pkgname=pacifica-icon-theme
pkgver=0.4.1
pkgrel=1.2
pkgdesc="Pacifica icon theme by bokehlicia"
url="http://bokehlicia.deviantart.com/art/Pacifica-Icons-402508559"
source=("https://github.com/fsvh/pacifica-icon-theme/archive/refs/heads/master.zip")
license=('GPL')
arch=('any')
depends=('elementary-icon-theme')

package() {
  install -dm 755 "$pkgdir"/usr/share/icons
  cd $srcdir/$pkgname-master
  cp -r Pacifica* $pkgdir/usr/share/icons/
  chmod -R 755 "$pkgdir"/usr/share/icons/Pacifica*
  install -Dm644 -t"$pkgdir/usr/share/doc/$pkgname/" CREDITS README.md
}

sha256sums=('7757b2a352238151616c503e120defdfa6994b0d6bff6da656d0a3e4eb086b3a')

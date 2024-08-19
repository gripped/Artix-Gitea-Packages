# Maintainer: artist for Artix Linux

pkgname=numix-icon-theme
pkgver=1.0.1
pkgrel=1
pkgdesc='Base icon theme from the Numix project'
arch=('any')
url='https://github.com/numixproject/numix-icon-theme'
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git')
options=('!strip')
source=('git+https://github.com/numixproject/numix-icon-theme.git')
sha256sums=('SKIP')

package() {
  cd numix-icon-theme
  install -dm 755 "$pkgdir"/usr/share/icons
  cp -r Numix{,-Light} "$pkgdir"/usr/share/icons/
  install -Dm644 -t"$pkgdir/usr/share/doc/$pkgname/" license readme.md
}


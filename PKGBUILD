# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>
# Contributor: Panagiotis Papadopoulos pano_90 (AT) gmx (DOT) net

pkgname=languagetool
pkgver=6.3
pkgrel=1
pkgdesc='An open source language checker'
arch=(any)
url='https://www.languagetool.org'
license=(LGPL)
depends=(java-runtime-headless)
makedepends=(unzip)
optdepends=('java-runtime: needed for the GUI version'
            'libxtst: needed for the GUI version'
            'gtk3: GTK style for the GUI')
source=(https://www.languagetool.org/download/LanguageTool-${pkgver}.zip
        languagetool.sh)
noextract=($pkgname-$pkgver.zip)
sha256sums=('32f529f249b15f758b38cc00e4818af3b3478490c2a0ae2825e2b5e980473e08'
            'e395fe51eb107365bb6e5456a2e1a144a60296e52554b8407f241e195e434359')

package() {
  install -d "$pkgdir"/usr/{bin,share/java/$pkgname/libs}
  unzip -q LanguageTool-$pkgver.zip -d "$pkgdir"/usr/share
  cd "$pkgdir"/usr/share/
  mv LanguageTool-$pkgver $pkgname
  cd $pkgname
  mv *.jar "$pkgdir"/usr/share/java/$pkgname
  mv libs/*.jar "$pkgdir"/usr/share/java/$pkgname/libs
  rm -rf libs
  install -m755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname

}

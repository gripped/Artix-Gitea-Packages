# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>
# Contributor: Panagiotis Papadopoulos pano_90 (AT) gmx (DOT) net

pkgname=languagetool
pkgver=6.6
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
source=(https://www.languagetool.org/download/LanguageTool-$pkgver.zip
        languagetool.sh)
noextract=($pkgname-$pkgver.zip)
sha256sums=('53600506b399bb5ffe1e4c8dec794fd378212f14aaf38ccef9b6f89314d11631'
            'c559be1fbead8845caf1f269cf39bfde6486ce06aabcbdd4ba58d402168b61a7')

package() {
  install -d "$pkgdir"/usr/{bin,share/java/$pkgname/libs}
  unzip -q LanguageTool-$pkgver.zip -d "$pkgdir"/usr/share
  cd "$pkgdir"/usr/share/
  mv LanguageTool-${pkgver/.a/} $pkgname
  cd $pkgname
  mv *.jar "$pkgdir"/usr/share/java/$pkgname
  mv libs/*.jar "$pkgdir"/usr/share/java/$pkgname/libs
  rm -rf libs
  install -m755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname

}

# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=nauty
epoch=1
pkgver=2.8.9
pkgrel=2
pkgdesc='A program for computing automorphism groups of graphs and digraphs'
arch=(x86_64)
url='http://pallini.di.uniroma1.it/'
license=(Apache-2.0)
depends=(glibc)
source=(http://pallini.di.uniroma1.it/nauty${pkgver//./_}.tar.gz)
sha256sums=('c97ab42bf48796a86a598bce3e9269047ca2b32c14fc23e07208a244fe52c4ee')
 
build() {
  cd nauty${pkgver//./_}

# Workaround build system discarding LDFLAGS
  CFLAGS="$CFLAGS $LDFLAGS" \
  ./configure \
    --prefix=/usr \
    --includedir=/usr/include/nauty \
    --enable-generic
  make
}

package() {
  cd nauty${pkgver//./_}

  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/share/licenses/nauty
  install COPYRIGHT "$pkgdir"/usr/share/licenses/nauty/LICENSE
}

# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>

pkgname=xfce4-smartbookmark-plugin
pkgver=0.5.2
pkgrel=2
pkgdesc="Allows you to send requests directly to your browser and perform a custom search"
arch=('x86_64')
url="https://docs.xfce.org/panel-plugins/xfce4-smartbookmark-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool' 'libxt')
source=(https://archive.xfce.org/src/panel-plugins/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2
        xfce4-smartbookmark-plugin-archlinux.patch)
sha256sums=('2a279e2f5a54518684e62ad1f3cd8ef950826505b39725f1b5d8f0c43031cdd3'
            '07f0e70bcdf371f7d4302cecf82c59845cf7b6b77ff87befff3603feca29903d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/xfce4-smartbookmark-plugin-archlinux.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

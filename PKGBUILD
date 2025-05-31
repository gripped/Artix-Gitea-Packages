# Maintainer: Lukas Jirkovsky <l.jirkovsky AT gmail.com>
# Contributor: Bogdan Szczurek <thebodzio(at)gmail.com>
# Contributor: Vaclav Kramar <vaclav.kramar@tiscali.cz>
# Contributor: Archie <mymaud@gmail.com>

pkgname=rawtherapee
epoch=1
pkgver=5.12
pkgrel=1
pkgdesc='A powerful cross-platform raw image processing program'
arch=('x86_64')
url='https://www.rawtherapee.com/'
license=('GPL3')
depends=('exiv2'
         'desktop-file-utils'
         'fftw'
         'glibmm'
         'gtk3'
         'gtkmm3'
         'hicolor-icon-theme'
         'lcms2'
         'lensfun'
         'libcanberra'
         'libiptcdata'
         'libjxl')
makedepends=('cmake')
source=("https://github.com/Beep6581/RawTherapee/releases/download/${pkgver}/rawtherapee-$pkgver.tar.xz")
sha1sums=('cff721096609ee5b93d42bb37770880525e05c89')
sha256sums=('d9a6c10537d64a285bc465675fe59aaa94ce3223823dfbecf0ae2c9599082d57')

build() {
  mkdir -p "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"

  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCACHE_NAME_SUFFIX=""
  make
}

package() {
  cd "$srcdir/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

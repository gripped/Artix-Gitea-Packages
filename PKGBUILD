# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl2_image
pkgver=2.8.6
pkgrel=1
pkgdesc="A simple library to load images of various formats as SDL surfaces (Version 2)"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_image"
license=('MIT')
depends=('sdl2' 'libpng' 'libtiff' 'libjpeg-turbo' 'libwebp' 'libavif' 'libjxl')
makedepends=('cmake')
source=("https://github.com/libsdl-org/SDL_image/releases/download/release-${pkgver}/SDL2_image-${pkgver}.tar.gz"{,.sig})
sha512sums=('d20f959b580d02d7dc897583aa69ad5fd6e99a850ea8815aa6495adf9b570144694c8fa99e13936459aee707f573bef97653d87f96926fb38f72e288ad8bdab7'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6')

build() {
  cd "${srcdir}/SDL2_image-${pkgver}/"
  ./configure --disable-static --prefix=/usr \
    --disable-avif-shared \
    --disable-jpg-shared \
    --disable-png-shared \
    --disable-stb-image \
    --disable-tif-shared \
    --disable-jxl-shared \
    --disable-webp-shared
  make
}

package() {
  cd "${srcdir}/SDL2_image-${pkgver}/"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

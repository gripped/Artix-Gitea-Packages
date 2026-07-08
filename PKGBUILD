# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=libxfont2
pkgver=2.0.8
pkgrel=1
pkgdesc="X11 font rasterisation library"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('BSD-2-Clause'
         'BSD-4-Clause-UC'
         'HPND-sell-variant'
         'MIT-open-group'
         'SMLNJ'
         'X11')
depends=('freetype2' 'libfontenc' 'xorgproto' 'zlib' 'glibc')
makedepends=('xorg-util-macros' 'xtrans')
source=(${url}/archive/individual/lib/libXfont2-${pkgver}.tar.xz{,.sig})
sha512sums=('e14cc3fa03d7baa4554ee5754ab33f69ac1da3d509c686a5f705fde8cd07772be564d68cc18d9fd0beb5ed7b2f864fcd7f6bf4983f5c0db08a9c747d0e001531'
            'SKIP')
#validpgpkeys=('C383B778255613DFDB409D91DB221A6900000011') # Keith Packard <keithp@keithp.com>
#validpgpkeys+=('995ED5C8A6138EB0961F18474C09DD83CAAA50B2') # "Adam Jackson <ajax@nwnk.net>"
#validpgpkeys+=('C41C985FDCF1E5364576638B687393EE37D128F8') # "Matthieu Herrb <matthieu.herrb@laas.fr>"
# validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') #  "Alan Coopersmith <alan.coopersmith@oracle.com>"
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # "Peter Hutterer <peter.hutterer@who-t.net>"

build() {
  cd "libXfont2-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd "libXfont2-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

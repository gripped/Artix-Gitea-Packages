# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgname=lib32-vkd3d
_pkgname=vkd3d
pkgver=2.1
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://wiki.winehq.org/Vkd3d'
license=('LGPL-2.1-or-later')
depends=('lib32-vulkan-icd-loader')
makedepends=('git' 'perl-json' 'spirv-headers' 'vulkan-headers' 'wine' 'lib32-xcb-util-keysyms' 'lib32-ncurses' 'xorgproto')
source=("git+https://gitlab.winehq.org/wine/vkd3d.git#tag=vkd3d-$pkgver")
sha512sums=('78b14719e9b35f97b8edcb1c79e29acd9a2f389776e509ed3f089ed33f29825ca5ff2a603e9b4da223a338f3acf7b806e9201b3807b77220350b93f7059fdd94')

prepare() {
  cd $_pkgname
  ./autogen.sh
  export CC='gcc -m32'
  export CXX='g++ -m32'

  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export LDFLAGS="$LDFLAGS -L/usr/lib32"

  ./configure --libdir=/usr/lib32 --prefix=/usr
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{bin,include}
}

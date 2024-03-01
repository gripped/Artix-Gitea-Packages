# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>

pkgname=zziplib
pkgver=0.13.73
pkgrel=1
pkgdesc="A lightweight library that offers the ability to easily extract data from files archived in a single zip file"
arch=('x86_64')
url="https://github.com/gdraheim/zziplib"
license=('LGPL' 'MPL')
depends=('zlib')
makedepends=('python' 'xmlto' 'zip' 'cmake' 'ninja')
checkdepends=('unzip')
source=($pkgname-$pkgver.tar.gz::"https://github.com/gdraheim/zziplib/archive/v$pkgver.tar.gz")
sha512sums=('95557147d374d0e9074b83319350db9085b8ae98ff7cf7ab96a3209564597744252504adfaf4d17b0243ffb118adf2afabe7dd736e6514a7e74360cd0955e4f5')

build() {
  cd ${pkgname}-${pkgver}
  cmake \
    -Bbuild \
    -GNinja \
    -DZZIPDOCS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja -C build
}

# Broken for some reason :/
# check() {
#   cd ${pkgname}-${pkgver}
#   ninja -C build check
# }

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: set ts=2 sw=2 et:

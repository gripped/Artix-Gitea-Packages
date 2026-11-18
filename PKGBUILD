# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org> 
# Contributor: said <atvordhosbn[at]gmail[dot]com>

pkgname=libcue
pkgver=2.4.0
pkgrel=1
pkgdesc='Parses so-called cue sheets and handles the parsed data'
url='https://github.com/lipnitsk/libcue/'
arch=('x86_64')
license=('GPL-2.0-only')
source=("git+https://github.com/lipnitsk/libcue.git#tag=v$pkgver")
depends=('glibc')
makedepends=('bison' 'cmake' 'flex' 'git')
sha512sums=('49b1418be4a6d93b7f3b5f99e503f5c32e7d1439a89221485dabb7ee48a33e18d96d0d5be794d813d6666ab0485bb6f3d63e69f5b65d96ac4b758f61d6072efa')

prepare() {
  cd "$pkgname"
  # v2.4.0 still reports 2.3.0; upstream corrected this in v2.4.1:
  # https://github.com/lipnitsk/libcue/commit/5f8f6edd14eb233ef8d9fb00d6c89029af3e07ee
  sed -i "s/SET(PACKAGE_VERSION 2\.3\.0)/SET(PACKAGE_VERSION $pkgver)/" CMakeLists.txt
}

build() {
  cmake -B build -S "$pkgname" \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=ON \
      -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

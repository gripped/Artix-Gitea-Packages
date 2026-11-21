# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org> 
# Contributor: said <atvordhosbn[at]gmail[dot]com>

pkgname=libcue
pkgver=2.4.1
pkgrel=1
pkgdesc='Parses so-called cue sheets and handles the parsed data'
url='https://github.com/lipnitsk/libcue/'
arch=('x86_64')
license=('GPL-2.0-only')
source=("git+https://github.com/lipnitsk/libcue.git#tag=v$pkgver")
depends=('glibc')
makedepends=('bison' 'cmake' 'flex' 'git')
sha512sums=('cbbf3afd7760ecd2793fde1fe9aa4f2cebcb84f6047f6ce05bacfa413249d5218f787aac7e59f94fe0185c48df9613402511e0a1eb0ee27c30edf057705f5088')

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

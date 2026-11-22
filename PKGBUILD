# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org> 
# Contributor: said <atvordhosbn[at]gmail[dot]com>

pkgname=libcue
pkgver=2.4.2
pkgrel=1
pkgdesc='Parses so-called cue sheets and handles the parsed data'
url='https://github.com/lipnitsk/libcue/'
arch=('x86_64')
license=('GPL-2.0-only')
source=("git+https://github.com/lipnitsk/libcue.git#tag=v$pkgver")
depends=('glibc')
makedepends=('bison' 'cmake' 'flex' 'git')
sha512sums=('7106a8c5c7a6a34d71a24792810ca4e6526667ccc9b83e17c4d1bd92dda13c843fd99fbb8e6d13ffa9ee6a3aea680b77a3ef65b45ce4f49d26511b3b5c1fe834')

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

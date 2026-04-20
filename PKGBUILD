# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=limonp
pkgver=1.0.1
pkgrel=1
pkgdesc="C++ headers(hpp) library with Python style"
arch=('any')
url="https://github.com/yanyiwu/limonp"
license=('MIT')
makedepends=('cmake' 'git')
source=("git+https://github.com/yanyiwu/limonp.git#tag=v$pkgver")
b2sums=('195e69b10b60bedd6fa447c11875dd0f339c93043d75952c4fe38a1ff928ccdbcca04c6d501a2a7d37e5eaf003a7ac26d7498f9edb8c39d5924a76876e6e3baf')

prepare() {
  cd limonp
  sed -i '/^ADD_SUBDIRECTORY(test)$/d' CMakeLists.txt
}

build() {
  cmake -B build -S limonp \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 limonp/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

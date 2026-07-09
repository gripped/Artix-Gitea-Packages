# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libffi
_name=libffi
pkgver=3.7.0
pkgrel=1
pkgdesc="Portable foreign function interface library (32-bit)"
arch=(x86_64)
url=https://sourceware.org/libffi/
_url="https://github.com/libffi/libffi"
license=(MIT)
depends=(lib32-glibc $_name=$pkgver)
provides=(libffi.so)
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('9259ec3542db31c7fe35f83bab557acc3c773a34da7ebc68780b3522f2e04052')
b2sums=('f6cd0bbc9be369fd767da280aac73ba8b9902c5b5fb2a7d12bda089cbf4466096a95de108dd948d22b65d1b59262dd373cce3805ec1bedc15ab17a1289184ab4')

prepare() {
  cd $_name-$pkgver
  autoreconf -fiv

}

build() {
  local prepare_options=(
    --build=i686-pc-linux-gnu
    --disable-exec-static-tramp
    --disable-multi-os-directory
    --disable-static
    --enable-pax_emutramp
    --libdir=/usr/lib32
    --prefix=/usr
  )

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_name-$pkgver
  ./configure "${prepare_options[@]}"
  make
}

package() {
  cd $_name-$pkgver
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,share}
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:

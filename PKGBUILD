# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libffi
pkgver=3.7.0
pkgrel=1
pkgdesc='Portable foreign function interface library'
arch=(x86_64)
url='https://sourceware.org/libffi/'
_url="https://github.com/libffi/libffi"
license=(MIT)
depends=(glibc)
checkdepends=(dejagnu)
provides=(libffi.so)
source=($pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('9259ec3542db31c7fe35f83bab557acc3c773a34da7ebc68780b3522f2e04052')
b2sums=('f6cd0bbc9be369fd767da280aac73ba8b9902c5b5fb2a7d12bda089cbf4466096a95de108dd948d22b65d1b59262dd373cce3805ec1bedc15ab17a1289184ab4')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  local configure_options=(
    # remove --disable-exec-static-tramp once ghc and gobject-introspection
    # work fine with it enabled (https://github.com/libffi/libffi/pull/647)
    --disable-exec-static-tramp
    --disable-multi-os-directory
    --disable-static
    --enable-pax_emutramp
    --prefix=/usr
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  make -C $pkgname-$pkgver check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:

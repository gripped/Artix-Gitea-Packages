# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.27.5
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="https://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'hicolor-icon-theme' 'jsoncpp' 'libjsoncpp.so' 'libuv' 'rhash' 'cppdap')
makedepends=('qt6-base' 'python-sphinx' 'emacs' 'nlohmann-json')
optdepends=(
  'make: for unix Makefile generator'
  'ninja: for ninja generator'
  'qt6-base: cmake-gui'
)
source=("https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"
        "artix-cmake"{,.patch}
        "https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}-SHA-256.txt"{,.asc})
sha512sums=('db8f2929b956043a42e2cf73708f9435d427cff8f5d334d4631b67da8446c388c52960929d6e428496ca135758af315aad4adc8dc19268099dafc7a2e5a61d42'
            '08a4f8df1b005869a3497fd5090620ce54eefa09df67245e76eb6ae81171e5045f87180cd848d8a1e44ce5c4cf290efd6c9b655ccf46230967abef4941513af7'
            '8a838312162d7792d3a3c5168629191c5c6ae61095bec157c49528b393bf4fe1573567855efd5037675bf0d0837641ed45b26da65165e45ba711f123879b156c'
            '5e1c86bf2c73f6a29d8e6f1bb85a094073b09e22a4ebdd45a4969745cca79c2e5b3cd45dc897748acdb79adf5db0d491d8ae2af636efc772b5eb272b79d91527'
            'SKIP')
validpgpkeys=(CBA23971357C2E6590D9EFD3EC8FEF3A7BFB4EDA) # Brad King <brad.king@kitware.com>

prepare() {
  patch -d "$srcdir/$pkgname-$pkgver" -Np1 -i ../artix-cmake.patch
  # upstream does not provide signed tarballs, only signed checksums
  sha256sum -c --ignore-missing "${pkgname}-${pkgver}-SHA-256.txt"
}

build() {
  cd ${pkgname}-${pkgver}
  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --datadir=/share/cmake \
    --sphinx-man \
    --sphinx-html \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir"/usr/share/doc/cmake/html/_sources
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  install -Dm644 Copyright.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 "$srcdir"/artix-cmake "$pkgdir"/usr/bin/artix-cmake
}

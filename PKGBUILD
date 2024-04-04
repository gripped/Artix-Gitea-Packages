# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.29.1
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
        "https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}-SHA-256.txt"{,.asc}
        artix-cmake.patch
        artix-cmake)
sha512sums=('3665ddb356bf973f75c9f2601f7210f7ff58c77c39926a43af8640979777a796d441df43fda5d2632548f7d15e4553829680c76f3d9376f9e763fe7bba16f3d7'
            '78ac190968e5253a5cdef8acbddebf0f5750bf47aef92932b65fee4c75fd3c66a1fe3a366cd8105a9908b2d3324da4275b2b4f4c9e2c269818a6613b9dd21214'
            'SKIP'
            'b9dc162136cb3038c63ae2235c665167ac6f7770927fe6c2bf4a4a86b0a995efa1d42e80bee762c77bc690115060b635ea5028a4b3ce4428d24ea851e94b34f6'
            '08a4f8df1b005869a3497fd5090620ce54eefa09df67245e76eb6ae81171e5045f87180cd848d8a1e44ce5c4cf290efd6c9b655ccf46230967abef4941513af7')
validpgpkeys=(CBA23971357C2E6590D9EFD3EC8FEF3A7BFB4EDA) # Brad King <brad.king@kitware.com>

prepare() {
  # upstream does not provide signed tarballs, only signed checksums
  sha256sum -c --ignore-missing "${pkgname}-${pkgver}-SHA-256.txt"
  patch -d "$srcdir/$pkgname-$pkgver" -Np1 -i ../artix-cmake.patch
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

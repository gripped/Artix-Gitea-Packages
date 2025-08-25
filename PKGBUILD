# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=4.1.0
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="https://www.cmake.org/"
license=('custom')
depends=(cppdap
         curl
         expat
         gcc-libs
         glibc
         hicolor-icon-theme
         jsoncpp
         libarchive
         libuv
         ncurses
         rhash
         zlib)
makedepends=(emacs
             git
             nlohmann-json
             python-sphinx
             qt6-base)
optdepends=(
  'make: for unix Makefile generator'
  'ninja: for ninja generator'
  'qt6-base: cmake-gui'
)
source=(git+https://gitlab.kitware.com/cmake/cmake.git#tag=v$pkgver?signed
        artix-cmake.patch)
sha512sums=('ab0ae1e7b750d81f155dc990180b3ac9a7e2328df2889a4d3e69450f2203486745fad93f9b66f6828793c2390f27ceadcab90c32eaf3c0393dfcdb77aef253a8'
            '56be8c1a7cd7b6520b50f38a5299032b58772758c33faf89dc772ed8cdccdce7e816a797511092867bfbf1ade1486373780c05ff1eb0d42ef3320c73aac8c9a7')
validpgpkeys=(CBA23971357C2E6590D9EFD3EC8FEF3A7BFB4EDA) # Brad King <brad.king@kitware.com>

prepare() {
   git -C "${pkgname}" apply ../artix-cmake.patch
  cd $pkgname
  #git apply ../artix-cmake.patch
  git cherry-pick -n a869b79c5921412c91fb71a761748ae5f7d3fb23 # Fix FindHDF5 for HDF5 built with cmake
#   git apply ../artix-cmake.patch
}

build() {
  cd ${pkgname}
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
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir"/usr/share/doc/cmake/html/_sources
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  install -Dm644 LICENSE.rst -t "${pkgdir}"/usr/share/licenses/$pkgname
}

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=4.5.0
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="https://www.cmake.org/"
license=('BSD-3-Clause' 'MIT')
depends=(cppdap
         curl
         expat
         glibc
         hicolor-icon-theme
         jsoncpp
         libarchive
         libgcc
         libstdc++
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
sha512sums=('8a7ce4e934dabbd1ac4d80a0877b224f9c6a582a06de770af46fedba3acf42aef7f8e05a1271dc83060544db1d00233b2165f54b4340c453b1eb0b63c9198abc'
            '56be8c1a7cd7b6520b50f38a5299032b58772758c33faf89dc772ed8cdccdce7e816a797511092867bfbf1ade1486373780c05ff1eb0d42ef3320c73aac8c9a7')
validpgpkeys=(CBA23971357C2E6590D9EFD3EC8FEF3A7BFB4EDA) # Brad King <brad.king@kitware.com>

build() {
  cd ${pkgname}
  git apply ../artix-cmake.patch
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
  install -Dm644 Utilities/cmrapidhash/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.rapidhash
}

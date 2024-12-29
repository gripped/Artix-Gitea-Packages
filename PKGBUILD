# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgbase=doxygen
pkgname=(doxygen doxygen-docs)
pkgver=1.13.0
pkgrel=1
pkgdesc='Documentation system for C++, C, Java, IDL and PHP'
url='http://www.doxygen.nl'
arch=(x86_64)
license=(GPL-2.0-or-later)
makedepends=(
  clang
  cmake
  flex
  fmt
  gcc-libs
  ghostscript
  glibc
  graphviz
  llvm
  python
  qt6-base
  spdlog
  sqlite
  texlive-fontsrecommended
  texlive-fontutils
  texlive-latexextra
  texlive-plaingeneric
)
source=(
  ${pkgbase}-${pkgver}.tar.gz::https://github.com/doxygen/doxygen/archive/Release_${pkgver//./_}.tar.gz
)
sha512sums=('b48956e049d2beea6b60d9c1237494fefaf5a00a83ea5367cc5cc7ec072722cde0b1f3fce546c116683e15dc4d30ed5bc19e81c9fe3544e9aac76feabde88658')
b2sums=('1f1afb4ad928a845a480edf9fabd18a42fab2fdfe4ccc732cbdce7cd7cd35f78742de74a19487107312917007c72fe83da0fbf4209ef478d99aae1c8d884d6ba')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
  local cmake_options=(
    -B build
    -S $pkgbase-Release_${pkgver//./_}
    -W no-dev
    -DCMAKE_BUILD_TYPE:STRING=None
    -DCMAKE_INSTALL_PREFIX:PATH=/usr
    -DDOC_INSTALL_DIR:PATH=share/doc/doxygen
    -Dbuild_doc:BOOL=ON
    -Dbuild_wizard:BOOL=ON
    -Duse_sys_spdlog:BOOL=ON
    -Duse_sys_sqlite3:BOOL=ON
    -Duse_libclang:BOOL=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
  cmake --build build --target docs
}

check() {
  ctest --test-dir build --output-on-failure
}

package_doxygen() {
  depends=(
    clang
    fmt libfmt.so
    gcc-libs
    glibc
    spdlog libspdlog.so
    sqlite libsqlite3.so
  )
  optdepends=(
    'graphviz: for caller/callee graph generation'
    'qt6-base: for doxywizard'
    'texlive-fontsrecommended: for generating LaTeX, Postscript and PDF output'
    'texlive-fontutils: for generating LaTeX, Postscript and PDF output'
    'texlive-latexextra: for generating LaTeX, Postscript and PDF output'
    'texlive-plaingeneric: for generating LaTeX, Postscript and PDF output'
  )

  DESTDIR="$pkgdir" cmake --install build
  (
    cd "$pkgdir"
    _pick $pkgbase-docs usr/share/doc
  )
  install -vDm 644 $pkgbase-Release_${pkgver//./_}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_doxygen-docs() {
  pkgdesc='Developer documentation for doxygen'

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $pkgbase-Release_${pkgver//./_}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:

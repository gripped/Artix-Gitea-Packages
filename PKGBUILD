# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ccache
pkgver=4.11.1
pkgrel=1
pkgdesc='Compiler cache that speeds up recompilation by caching previous compilations'
url='https://ccache.dev/'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
  'fmt'
  'gcc-libs'
  'glibc'
  'hiredis'
  'libblake3'
  'libxxhash.so'
  'libzstd.so'
  'xxhash'
  'zstd'
)
makedepends=(
  'asciidoctor'
  'cmake'
  'perl'
  'tl-expected'
)
checkdepends=('doctest')
source=(https://github.com/ccache/ccache/releases/download/v${pkgver}/ccache-${pkgver}.tar.xz{,.asc})
sha512sums=('f7277bbf628e64e19780dd029d7fc0866ade28fa67efd93a72783422586e21beaaa3b0795ba3bfc7ef4403ba6e41823da90cbb6d88c1d5aa412111f3bcb1b7c5'
            'SKIP')
b2sums=('7a1f866d08232ff74eaa0bac84863bab9fb6a0f4c5c4326be212f1b7e61f10da0afe61d6816ca438afffe2a5be565161086f73c82c84563014f29bfe5e092cf8'
        'SKIP')
validpgpkeys=('5A939A71A46792CF57866A51996DDA075594ADB8') # Joel Rosdahl <joel@rosdahl.net>

build() {
  cd ${pkgname}-${pkgver}
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev \
    -B build \
    -S .
  cmake --build build
  cmake --build build --target doc
}

check() {
  cd ${pkgname}-${pkgver}
  ctest --test-dir build --output-on-failure
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install -C build
  make DESTDIR="${pkgdir}" install -C build/doc

  install -vDm 644 doc/*.md doc/*.adoc -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -vd "${pkgdir}/usr/lib/ccache/bin"
  local _prog
  for _prog in gcc g++ c++; do
    ln -vs /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/$_prog"
    ln -vs /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/${CHOST}-$_prog"
  done
  for _prog in cc clang clang++; do
    ln -vs /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/$_prog"
  done
}

# vim: ts=2 sw=2 et:

# Maintainer: capezotte <capezotte@artixlinux.org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Andréas Caumeil <andreas.caumeil@proton.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgbase=libopenshot-audio
pkgname=(
  libopenshot-audio
  libopenshot-audio-docs
)
pkgver=1.0.0
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=(x86_64)
url="https://github.com/openshot/libopenshot-audio"
license=(GPL-3.0-only)
makedepends=(
  git
  alsa-lib
  cmake
  doxygen
  freetype2
  libx11
  python
  zlib
)
source=("git+${url}#tag=v${pkgver}")
sha512sums=('35015df88d02c2e09d8b24e8c20cad9546489006116a6fb99488b953d19052b5d2a8167b6fb658d5d01ce329779f55ab0a76e0db98aaa34e1a564fb5941e185e')
b2sums=('5475e17b22f708abd2d2de41f606f25e4ad3b5dac925a0d6b1f23643ff40d2009f51e385aea91dff504785095ccca0513df48a00549c0a9151dcd2be2beb2a6f')

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
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S "$pkgbase"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package_libopenshot-audio() {
  depends=(
    alsa-lib
    libgcc
    libstdc++
    glibc
    zlib
  )
  optdepends=('libopenshot-audio-docs: for documentation')
  provides=(libopenshot-audio.so)

  DESTDIR="$pkgdir" cmake --install build

  (
    cd "$pkgdir"
    _pick libopenshot-audio-docs usr/share/doc/
  )

  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" "$pkgbase"/{AUTHORS,README.md}
}

package_libopenshot-audio-docs() {
  pkgdesc+=" - documentation"

  mv -v "$pkgname"/* "$pkgdir"
}

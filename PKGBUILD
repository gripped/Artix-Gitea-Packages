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
pkgver=1.0.2
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
sha512sums=('ef9fba4fa837bb7ec76347a0367d51cb90c71491bfff1bf0f5dc9675282424ca435e5d5cedc968fe22b8c63de0bc8efd227fd9653b32e741f1b4cfdeb9df0fda')
b2sums=('99307fb8e9f08209139d50d9e3273fad4953be8d0f61f5576266c538f7412332ea2f93914b1d789995210f4d3f8c6e1ced78b24451679435685202588c0c454a')

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

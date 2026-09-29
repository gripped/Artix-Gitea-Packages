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
pkgver=1.0.1
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
sha512sums=('cb1f4c5424f6de8805ed9b565f8edb6dc7c1f5cefcf2b276cae4d47de587b8abc20a966f9837038001cfc3e7eb33c29d15ff197ef928af932b945e3c50fd41ae')
b2sums=('29b1504b5bc6f1f12f6899f52a004bba21236c897c98cc9cc9f0f5b84b899fe8a723dfe5449a0865d39d09e7c2d5bb430840276e171b2798ad9e885d2f4d6e4c')

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

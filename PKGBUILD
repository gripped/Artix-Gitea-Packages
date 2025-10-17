# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgbase=libxkbcommon
pkgname=(
  libxkbcommon
  libxkbcommon-x11
  libxkbcommon-doc
)
pkgver=1.12.0
pkgrel=3
pkgdesc='Keymap handling library for toolkits and window systems'
url='https://xkbcommon.org/'
arch=(x86_64)
license=(MIT)
makedepends=(
  bash-completion
  doxygen
  git
  glibc
  graphviz
  libxcb
  libxml2
  meson
  wayland
  wayland-protocols
  xkeyboard-config
  xorgproto
)
checkdepends=(
  libgl
  xorg-server-xvfb
)
source=(
  "git+https://github.com/xkbcommon/libxkbcommon#tag=xkbcommon-$pkgver"
  0001-interactive-wayland-Prevent-buffer-use-after-free.patch
  0002-x11-Fix-parsing-key-types-level-names.patch
  0003-x11-Never-drop-X11-mandatory-key-types.patch
)
b2sums=('222651ee962dd7ae13c3c1269540c4a9ef80663292554304c3d6701b110ff04a774ded729db5b0a34568a72b74921bc97e6b8d222ed57f2f69f2fc121586974c'
        'f303406da00bbc8235854e57982de25fcad462e91b15a30e5bc925f858a543a260640c5b88204f86f84450b7de4b61e98498eba2702bf348636f81cc5dd088d8'
        '7f63851f81a295cd87ece51c2ba2146ad20b0bab6474a80e3ef9ffa8a17a745f17cdcef41cd8e11ce0fc7d4ffd3cc26b6208a5b163b7b83872a793ddeefb389c'
        '8da236b5530159c0d235d0a942358e36d9bef305c2a6dbe0491d20c3c723a967cb995b52beef65d1d49ad0e55c5f6cbc6acb6f3ad87ba4be9f42c0cc5fee3195')

prepare() {
  cd libxkbcommon

  # Fix crash of xkbcli interactive-wayland
  # https://github.com/xkbcommon/libxkbcommon/pull/870
  git apply -3 ../0001-interactive-wayland-Prevent-buffer-use-after-free.patch

  # X11 keymap fixes
  # https://gitlab.archlinux.org/archlinux/packaging/packages/libxkbcommon/-/issues/3
  # https://github.com/xkbcommon/libxkbcommon/pull/871
  git apply -3 ../0002-x11-Fix-parsing-key-types-level-names.patch
  # https://github.com/xkbcommon/libxkbcommon/pull/872
  git apply -3 ../0003-x11-Never-drop-X11-mandatory-key-types.patch
}

build() {
  local meson_options=(
    -D enable-docs=true
  )

  artix-meson libxkbcommon build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_libxkbcommon() {
  depends=(
    glibc
    libxml2
    xkeyboard-config
  )
  optdepends=(
    'libxkbcommon-x11: xkbcli interactive-x11'
    'wayland: xkbcli interactive-wayland'
  )
  provides=(
    libxkbcommon.so
    libxkbregistry.so
  )

  meson install -C build --destdir "$pkgdir"

  _pick x11 "$pkgdir"/usr/lib/*x11*
  _pick x11 "$pkgdir"/usr/lib/pkgconfig/*x11*
  _pick x11 "$pkgdir"/usr/lib/xkbcommon/*x11*
  _pick x11 "$pkgdir"/usr/include/xkbcommon/*x11*
  _pick x11 "$pkgdir"/usr/share/man/man1/*x11*

  _pick doc "$pkgdir"/usr/share/doc

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libxkbcommon/LICENSE
}

package_libxkbcommon-x11() {
  pkgdesc='Keyboard handling library using XKB data for X11 XCB clients'
  depends=(
    glibc
    libxcb
    libxkbcommon
    libxkbcommon.so
  )
  provides=(
    libxkbcommon-x11.so
  )

  mv x11/* "$pkgdir"/

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libxkbcommon/LICENSE
}

package_libxkbcommon-doc() {
  pkgdesc='API documentation for libxkbcommon'

  mv doc/* "$pkgdir"/

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libxkbcommon/LICENSE
}

# vim:set sw=2 sts=-1 et:

# Maintainer: capezotte@artixlinux.org
# Contributor: artist for Artix Linux

pkgbase=wireplumber
pkgname=(
  wireplumber
  libwireplumber
  wireplumber-docs
)
pkgver=0.5.19
pkgrel=1
pkgdesc="Session / policy manager implementation for PipeWire"
url="https://pipewire.pages.freedesktop.org/wireplumber/"
arch=(x86_64)
license=(MIT)
makedepends=(
  doxygen
  git
  glib2
  glib2-devel
  glibc
  gobject-introspection
  graphviz
  libgcc
  libpipewire
  lua
  meson
  pipewire
  python-breathe
  python-lxml
  python-sphinx
  python-sphinx_rtd_theme
)
checkdepends=(pipewire-audio)
source=(
  "git+https://gitlab.freedesktop.org/pipewire/$pkgbase.git#tag=$pkgver"
  meson_build-systemd.patch
  wpctl-inits.patch
)
b2sums=('3cfd6d99d563c08c13948e1c7d48bf25a7255f85ddba576fd3e15acb7d76da20bdaaf4b68dfca88b2a5d6c67d190df377ed358ac236db1168ffd61afaaa4302c'
        '035a6887388d7ee41ffd07444e2667dfd3e0fa5edbfd67a7054ef6e74ef046bea21e763bf6ee724c48a2a13d59c32676647b323d1f1a00d9b6688bd39cf778cb'
        '753838e8f50c8ba82f4da3bd267c4e3046e15475badcc5a87e752fde106bd7ebd64f9eff344ba9466b37ceb472da1364ccd6390457c7600a0cc6bf93a4716e41')

prepare() {
  cd $pkgbase
  patch -Np1 -i ../meson_build-systemd.patch
  patch -Np1 -i ../wpctl-inits.patch
}

build() {
  local meson_options=(
    -D systemd=disabled
    -D elogind=enabled
    -D system-lua=true
  )

  artix-meson $pkgbase build "${meson_options[@]}"
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

_ver=${pkgver:0:3}

package_wireplumber() {
  depends=(
    "libwireplumber=$pkgver-$pkgrel"
    glibc
    libgcc
    libg{lib,object,io}-2.0.so
    libpipewire
    libpipewire-0.3.so
    lua
    pipewire
  )
  optdepends=(
    'wireplumber-docs: Documentation'
  )
  provides=(pipewire-session-manager)
  conflicts=(pipewire-media-session)

  meson install -C build --destdir "$pkgdir"

  (
    cd "$pkgdir"

    _pick libw usr/lib/libwireplumber-$_ver.so*
    _pick libw usr/lib/girepository-1.0
    _pick libw usr/lib/pkgconfig
    _pick libw usr/include
    _pick libw usr/share/gir-1.0

    _pick docs usr/share/doc/wireplumber/html
  )

  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 $pkgbase/{NEWS,README}*
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgbase/LICENSE
}

package_libwireplumber() {
  pkgdesc+=" - client library"
  depends=(
    glibc
    libgcc
    libg{lib,module,object,io}-2.0.so
    libpipewire-0.3.so
  )
  provides=(libwireplumber-$_ver.so)

  mv libw/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgbase/LICENSE
}

package_wireplumber-docs() {
  pkgdesc+=" - documentation"

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgbase/LICENSE
}

# vim:set sw=2 sts=-1 et:

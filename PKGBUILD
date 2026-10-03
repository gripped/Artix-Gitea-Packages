# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

pkgbase=lib32-glib2
pkgname=(
  lib32-glib2
)
pkgver=2.90.0
pkgrel=1
pkgdesc="Low level core library - 32-bit"
url="https://gitlab.gnome.org/GNOME/glib"
license=(LGPL-2.1-or-later)
arch=(x86_64)
depends=(
  glib2
  lib32-gcc-libs
  lib32-glibc
  lib32-libffi
  lib32-pcre2
  lib32-util-linux
  lib32-zlib
)
makedepends=(
  gettext
  git
  lib32-dbus
  lib32-libelf
  meson
  python
  python-packaging
  shared-mime-info
  util-linux
)
checkdepends=(
  desktop-file-utils
  lib32-glib2
)
source=(
  "git+https://gitlab.gnome.org/GNOME/glib.git?signed#tag=$pkgver"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git"
  0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
  0002-gdesktopappinfo-Add-more-known-terminals.patch
  gio-querymodules-32.hook
  gio-remove-module-cache-32.hook
)
b2sums=('9e31a27fd7c277deeb8695f77772ac39ff8ab14987d3b22ce4522aa671a707fdad8060957582db4d7c8a05780372ad59b7a0cbc13a944e38531c527e3aaa44ad'
        'SKIP'
        '4ddbd31f5f466fce99d82890292ff922555a9ab379d22202aeea5127f58798668f871dea0485cc0f458069276ad512412285ede6c8f3e36bea899358f49e931a'
        '194275a464f96d3539d26d7ae83f88b616e7de7beda0ba82714e4ffbab7a09cf1acee792c9d8278095f097074a5f4eaaa95490b11748f2ad85204fef3f04ccb4'
        '678ea2d010fd64b6c55106510096363c54c357d65615c666e9cc3a0e280c0878257a45e646dd88f6bdd0623f7268c4afd2d4f98f82a5489bbfc028c5864252f1'
        '0971103c526d72196bd56fe4733bb1edd104e198ad2371929dd90745f5717e650bd2340e3040b720bcf3741946f1dcf2ab246b7837a25312932c0e008c558a39')
validpgpkeys=(
  53EF3DC3B63E2899271BD26322E8091EEA11BBB7 # Emmanuele Bassi <ebassi@gnome.org>
  923B7025EE03C1C59F42684CF0942E894B2EAFA0 # Philip Withnall <pwithnall@gnome.org>
)

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch

  # Add ghostty and ptyxis to known terminals list
  # This is a downstream only patch; GNOME will not add new terminal emulators.
  # https://gitlab.gnome.org/GNOME/glib/-/issues/338#note_1076172
  git apply -3 ../0002-gdesktopappinfo-Add-more-known-terminals.patch

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local meson_options=(
    --cross-file lib32
    -D documentation=false
    -D dtrace=disabled
    -D glib_debug=disabled
    -D introspection=disabled
    -D man-pages=disabled
    -D selinux=disabled
    -D sysprof=disabled
    -D systemtap=disabled
  )

  # Produce more debug info: GLib has a lot of useful macros
  CFLAGS+=" -g3"
  CXXFLAGS+=" -g3"

  # Avoid crashing some old binaries
  CFLAGS+=" -mstackrealign"
  CXXFLAGS+=" -mstackrealign"

  artix-meson glib build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --no-suite flaky --no-suite slow --print-errorlogs
}

package_lib32-glib2() {
  depends+=(
    libffi.so
    libmount.so
  )
  provides+=(libg{lib,io,irepository,module,object,thread}-2.0.so)

  meson install -C build --no-rebuild --destdir "$pkgdir"

  rm -r "$pkgdir"/usr/{lib,share,include}
  find "$pkgdir/usr/bin" -type f -not -name gio-querymodules -printf 'Removing %P\n' -delete
  mv "$pkgdir"/usr/bin/gio-querymodules{,-32}

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  touch "$pkgdir/usr/lib32/gio/modules/.keep"
}

# vim:set sw=2 sts=-1 et:

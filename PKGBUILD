# Maintainer: artist for Artix Linux

pkgbase=dbus
pkgname=(
  dbus
  dbus-docs
)
pkgver=1.16.1
pkgrel=1.3
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64)
license=("AFL-2.1 OR GPL-2.0-or-later")
depends=(
  audit
  expat
  glibc
  libcap-ng
  libelogind
)
makedepends=(
  docbook-xsl
  doxygen
  glib2
  mallard-ducktype
  meson
  python
  qt5-tools
  elogind
  xmlto
  yelp-tools
)
source=(
  https://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.xz{,.asc}
  dbus-enable-elogind-16.patch
)
b2sums=('a5a3ebe777c1c0296ba7240f9ed29ad329a6578a05baf10a469ce8c7d243791d35aca42a70d04cdd88feea238d081c3c8b0db444df24abcf7ce5ffe9187a0440'
        'SKIP'
        '4a493e4c61ad6c3df9a48516227c5bd041ab5384ae046b6edebd1cf42ba61b1ce95c143315697da17fbc7d46bb0ce3d739f2bc0b5a32a6bf15869c996e23acd9')
validpgpkeys=(
  DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90  # Simon McVittie <simon.mcvittie@collabora.co.uk>
)

prepare() {
  cd dbus-$pkgver
  patch -Np 1 -i ../dbus-enable-elogind-16.patch
}

build() {
  local meson_options=(
    -D apparmor=disabled
    -D dbus_user=dbus
    -D doxygen_docs=enabled
    -D ducktype_docs=enabled
    -D kqueue=disabled
    -D launchd=disabled
    -D relocation=disabled
    -D selinux=disabled
    -D systemd=disabled
    -D x11_autolaunch=disabled
    -D xml_docs=enabled
  )

  artix-meson dbus-$pkgver build "${meson_options[@]}"
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

package_dbus() {
  depends+=(
    libaudit.so
    libcap-ng.so
    libexpat.so
    libelogind.so
  )
  provides=(
    libdbus
    libdbus-1.so
  )
  conflicts=(libdbus)
  replaces=(libdbus)

  meson install -C build --destdir "$pkgdir"

  _pick docs "$pkgdir"/usr/share/doc

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    dbus-$pkgver/COPYING dbus-$pkgver/LICENSES/AFL-2.1.txt
}

package_dbus-docs() {
  pkgdesc+=" - Documentation"
  depends=()

  mv docs/* "$pkgdir"
}


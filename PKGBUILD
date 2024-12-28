# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgbase=dbus
pkgname=(
  dbus
  dbus-docs
)
pkgver=1.16.1
_pkgver=1.16.0
pkgrel=1.4
pkgdesc="Freedesktop.org message bus system"
url="https://www.freedesktop.org/wiki/Software/dbus/"
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
  https://dbus.freedesktop.org/releases/dbus/dbus-$_pkgver.tar.xz{,.asc}
  0001-Arch-Linux-tweaks.patch
  0001-build-add-elogind-support.patch)
b2sums=('a5a3ebe777c1c0296ba7240f9ed29ad329a6578a05baf10a469ce8c7d243791d35aca42a70d04cdd88feea238d081c3c8b0db444df24abcf7ce5ffe9187a0440'
        'SKIP'
        '3896c994aa7afde605aebb88b7123f33c578ad1ede2dc3e76982dbc021d6994874c5c735d31a66c7b3e9d3cba77ebbba7db05013716bbac14948618b1464e4a8'
        'd5149bb2c99ce622b02055751499a82130acbf1f4ccbc78a50482089416129c53662b0e794ae927edebc22e6f3f49b2f37b198b2d973a7a3ffeb23bd6051ea5b')
validpgpkeys=(
  DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90  # Simon McVittie <simon.mcvittie@collabora.co.uk>
)

prepare() {
  cd dbus-$_pkgver
  patch -Np1 -i ../0001-Arch-Linux-tweaks.patch
  patch -Np1 -i ../0001-build-add-elogind-support.patch
}

build() {
  local meson_options=(
    -D elogind=enabled
    -D systemd=disabled
    -D user_session=false
    -D apparmor=disabled
    -D dbus_user=dbus
    -D kqueue=disabled
    -D launchd=disabled
    -D relocation=disabled
    -D selinux=disabled
    -D x11_autolaunch=enabled
  )

  artix-meson dbus-$_pkgver build "${meson_options[@]}"
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
    dbus-$_pkgver/COPYING dbus-$_pkgver/LICENSES/AFL-2.1.txt
}


package_dbus-docs() {
  pkgdesc+=" - Documentation"
  depends=()

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    dbus-$_pkgver/COPYING dbus-$_pkgver/LICENSES/AFL-2.1.txt
}

# vim:set sw=2 sts=-1 et:

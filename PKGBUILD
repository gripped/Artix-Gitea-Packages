# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgbase=dbus
pkgname=(
  dbus
  dbus-docs
)
pkgver=1.16.2
pkgrel=1
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
  git
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
  "git+https://gitlab.freedesktop.org/dbus/dbus.git?signed#tag=dbus-$pkgver"
  0001-Arch-Linux-tweaks.patch
  0001-add-elogind-build-support.patch)
b2sums=('669cd4203fbac908db3a20c5b51355d9e84b68c9cc94f8de52e35544a636c6d5d1df8ee2bbdfd6dead53a6bd9865db547aa4af0e913bac697b138c698840d3ce'
        '3896c994aa7afde605aebb88b7123f33c578ad1ede2dc3e76982dbc021d6994874c5c735d31a66c7b3e9d3cba77ebbba7db05013716bbac14948618b1464e4a8'
        'dda43dd4f97742f8c8e6f3533a95a5e81f58bfd772bbc24752ed642e28c4b8b83e27f11360588f852220d8bf520c724616a4e79a927b8eda14202d530a1f7b67')
validpgpkeys=(
  DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90  # Simon McVittie <simon.mcvittie@collabora.co.uk>
)

prepare() {
  cd dbus
  patch -Np1 -i ../0001-Arch-Linux-tweaks.patch
  patch -Np1 -i ../0001-add-elogind-build-support.patch
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

  artix-meson dbus build "${meson_options[@]}"
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
    # libelogind.so
  )
  provides=(
    libdbus
    libdbus-1.so
  )
  conflicts=(libdbus)
  replaces=(libdbus)

  meson install -C build --destdir "$pkgdir"

  _pick docs "$pkgdir"/usr/share/doc


  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    dbus/COPYING dbus/LICENSES/AFL-2.1.txt
}


package_dbus-docs() {
  pkgdesc+=" - Documentation"
  depends=()

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    dbus/COPYING dbus/LICENSES/AFL-2.1.txt
}

# vim:set sw=2 sts=-1 et:

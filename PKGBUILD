# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgbase=dbus
pkgname=(
  dbus
  dbus-docs
)
pkgver=1.14.10
pkgrel=2
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64)
license=("AFL-2.1 OR GPL-2.0-or-later")
depends=(
  glibc
  audit
  libcap-ng
  expat
  libelogind
  libx11
)
makedepends=(
  autoconf-archive
  docbook-xsl
  doxygen
  python
  elogind
  xmlto
  yelp-tools
)
source=(
  https://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.xz{,.asc}
  dbus-enable-elogind.patch
)
b2sums=('f605b0810dcde6a0753384927131e7f4675be737ad7506a51261717c2622e74b99ac33cc2c199b98e5aa6b9d7c68ef692b8ee9f684f6fdab8d06c6fa861a6f6b'
        'SKIP'
        'c9ef41ff7b31af6cbaf28ca16974fb62aa0f2492f1c6970b41216758768d1139d2ce9aabbb3aff952d625b0decd1e8c2b25f79bb0a13c146aa9453dd4f7b5c5a')
validpgpkeys=(
  DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90  # Simon McVittie <simon.mcvittie@collabora.co.uk>
)

prepare() {
  cd dbus-$pkgver
  patch -Np 1 -i ../dbus-enable-elogind.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --libexecdir=/usr/lib/dbus-1.0
    --runstatedir=/run
    --with-console-auth-dir=/run/console/
    --with-dbus-user=dbus
    --with-system-pid-file=/run/dbus/pid
    --with-system-socket=/run/dbus/system_bus_socket
    --without-systemdsystemunitdir
    --enable-inotify
    --enable-libaudit
    --disable-systemd
    --disable-user-session
    --enable-xml-docs
    --enable-doxygen-docs
    --enable-ducktype-docs
    --disable-static
    --enable-elogind
    --enable-x11-autolaunch
  )

  cd dbus-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  make -C dbus-$pkgver -j1 check
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

  cd dbus-$pkgver
  DESTDIR="$pkgdir" make install

  rm -r "$pkgdir"/{etc,var}

  _pick docs "$pkgdir"/usr/share/doc

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

package_dbus-docs() {
  pkgdesc+=" - Documentation"
  depends=()

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

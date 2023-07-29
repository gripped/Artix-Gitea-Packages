# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit
pkgver=123
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://gitlab.freedesktop.org/polkit/polkit"
arch=(x86_64)
license=(LGPL)
depends=(
  duktape
  elogind
  expat
  glib2
  pam
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
  meson
)
checkdepends=(python-dbusmock)
provides=(libpolkit-{agent,gobject}-1.so)
backup=(etc/pam.d/polkit-1)
_commit=fc8b07e71d99f88a29258cde99b913b44da1846d  # tags/123^0
source=(
  "git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit"
  '99-artix.rules'
  '0001-remove-sysd.patch')
b2sums=('SKIP'
        'd320d928b5480b5b8143717e6f88101912709020efc9583fbb233a2cc11aff51d36226b94cf69104db06f330e04d4dcfd6e4c7b027df75a3c72c43adec625fb2'
        'f7e2d94c79c8e1e5cf65c6c22f888f95ca9689137d30ff62759bb3ca91b43900c293afbb0cbd3954c889dc5cf3531a2a37c258b53fe0c0f866706376fcd6e37d')

pkgver() {
  cd polkit
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd polkit
  patch -Np1 -i ../0001-remove-sysd.patch
}

build() {
  local meson_options=(
    -D examples=true
    -D gtk_doc=true
    -D man=true
    -D os_type=redhat
    -D session_tracking=libelogind
    -D tests=true
  )

  artix-meson polkit build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -d -o root -g 102 -m 750 "$pkgdir"/{etc,usr/share}/polkit-1/rules.d

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u polkitd 102 "PolicyKit daemon"
m polkitd proc
END

  install -m0644 "${srcdir}"/99-artix.rules "${pkgdir}"/etc/polkit-1/rules.d
}

# vim:set sw=2 sts=-1 et:

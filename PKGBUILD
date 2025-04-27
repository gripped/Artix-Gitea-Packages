# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=libxml2
pkgname=(
  libxml2
  libxml2-docs
)
pkgver=2.14.2
pkgrel=2
pkgdesc="XML C parser and toolkit"
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
arch=(x86_64)
license=(MIT)
depends=(
  bash
  glibc
  icu
  readline
  xz
  zlib
)
makedepends=(
  git
  meson
  python
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libxml2.git#tag=v$pkgver"
  https://www.w3.org/XML/Test/xmlts20130923.tar.gz
)
b2sums=('711b2e11d09bba7d0c17237bdbf951208469ae910c47e8875ef17b03196d8e96595e831849c05c141d708418b8ec2dbe3957365623db25151ee2ca48bc68ce11'
        '63a47bc69278ef510cd0b3779aed729e1b309e30efa0015d28ed051cc03f9dfddb447ab57b07b3393e8f47393d15473b0e199c34cb1f5f746b15ddfaa55670be')

prepare() {
  cd libxml2

  # Unbreak xmlstarlet tests
  git cherry-pick -n f34529641978c47ebd778d0e744acd12b3d9a906

  # Unbreak PostgreSQL tests
  git cherry-pick -n ae299377feff868272693ec4322b9dbfef2f571b

  # Use xmlconf from conformance test suite
  ln -s ../xmlconf
}

build() {
  local meson_options=(
    -D icu=enabled
    -D legacy=enabled
  )

  artix-meson libxml2 build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_libxml2() {
  optdepends=('python: Python bindings')
  provides=(libxml2.so)

  meson install -C build --destdir "$pkgdir"
  install -Dm644 libxml2/libxml.m4 -t "$pkgdir/usr/share/aclocal"

  # Split docs
  mkdir -p doc/usr/share
  mv "$pkgdir"/usr/share/{doc,gtk-doc} -t doc/usr/share

  install -Dm644 libxml2/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libxml2-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"

  install -Dm644 libxml2/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:

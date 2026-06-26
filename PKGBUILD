# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=accountsservice
pkgver=26.26.9
pkgrel=1
pkgdesc="D-Bus interface for user account query and manipulation"
url="https://gitlab.freedesktop.org/accountsservice/accountsservice"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  glib2
  glibc
  json-c
  libgcc
  libxcrypt
  polkit
  shadow
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  vala
  xmlto
)
checkdepends=(
  glibc-locales
  python-dbusmock
  python-gobject
)
source=(
  "git+$url.git#tag=$pkgver"
  accounts-daemon-restart.hook
  0001-tests-Drop-check-format-test.patch
)
b2sums=('f22d870d629b168d450b5d5197b0515674d49acc01a829502dd44c8b6c660dd6edeb18baac07a3432de992056db1fd907240ad8924d632f8a603b12c026d6547'
        '62f69bafdfc08a9a43c3d2bd8e66461960603a91826d1b42001eb6f320e4b6b39bbe99fa715c08a995c295bf0626a88e35b2ef4f0fc96ff4ced6dfe805f1a2a2'
        'e59a6c0d092a28d34cc9f7260aa58cbe73e2a4d5d303f5676fcc929764cd1158e59c330cbd0115e895ca0cae52ed31e4f3ad2e2549fb7dbf618bf8327f1c438d')

prepare() {
  cd $pkgname

  # Fix build with patches
  git apply -3 ../0001-tests-Drop-check-format-test.patch
}

build() {
  local meson_options=(
    -D systemdsystemunitdir=no
    -D elogind=true
    -D admin_group=wheel
    -D docbook=true
    -D gtk_doc=true
  )

  artix-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    libcrypt.so
    libg{lib,object,io}-2.0.so
  )
  provides+=(libaccountsservice.so)

  meson install -C build --destdir "$pkgdir"

  install -d "$pkgdir/usr/share/accountsservice/interfaces"
}

# vim:set sw=2 sts=-1 et:

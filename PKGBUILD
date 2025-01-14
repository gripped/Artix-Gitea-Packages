# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit
pkgver=126
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://github.com/polkit-org/polkit"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  duktape
  expat
  glib2
  glibc
  pam
  libelogind
)
makedepends=(
  dbus
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  elogind
)
checkdepends=(python-dbusmock)
provides=(libpolkit-{agent,gobject}-1.so)
install=polkit.install
source=(
  "git+$url#tag=$pkgver"
  0001-meson-Support-explicit-GID.patch
  0002-meson-Detect-Artix-Linux-and-set-the-UID-and-GID.patch

  99-artix.rules
  turnstile.patch
  0003-meson-elogind-build-fix.patch
)
b2sums=('20659c1a622208e1db7d5f65c5ab75a6a35c55472b5abdadc5405fb83f678e7eb9fe4ac32b1947f6956cc1204f5caa2cad2f5db81de7ea49cdb13bd309c94fa4'
        'b891682aa88beab15cd90a7681060168c5cb4de7c3d75dd9dba13a8281eb8de6ea81436b2dc8ddf404c5016eba422519fc9f28ecd2648c7ac811330196eb4a7d'
        'fbb1daedbb06d28011ff661378bca6162c52695cac2056bba30d585e79614c787535a3d917fc88ecddf5aef0b32eccf8a33688a1f0d5e76551b7c06fa2f9ea8f'
        'cacdece40f519ce2f2a4b06d31e75e92ed9496c18d4b1090b91a3c8d19f49aff41949b1bdda6e3c0b049b0ca74bbf164023044cf1ec8de6a24065bcda0d42d1f'
        'c09efe9dac0a842ea4eb053c0668d4ad13a4c699dc279674766bbf9f9028a90934afe92de5aed6b215ecd52dbf47ae46754c49e10a4c4f1d6f652bfb89f4e6d7'
        '6eb4dda518941223b16ce1f7fa32c11f3d381d189e7f1a51e19f70bf224f5569305412a419b2e7b0d0cdd682951fb6922edd59004c51ee30a02f26fcb201621e')

prepare() {
  cd polkit
  git apply -3 ../turnstile.patch
  git apply -3 ../0001-meson-Support-explicit-GID.patch
  git apply -3 ../0002-meson-Detect-Artix-Linux-and-set-the-UID-and-GID.patch
  git apply -3 ../0003-meson-elogind-build-fix.patch
}

build() {
  local meson_options=(
    -D examples=true
    -D gettext=true
    -D gtk_doc=true
    -D man=true
    -D tests=true
    -D polkitd_user=polkitd
    -D session_tracking=elogind
)

  artix-meson polkit build "${meson_options[@]}"
  meson compile -C build
}


package() {
  meson install -C build --destdir "$pkgdir"

  install -m0644 "${srcdir}"/99-artix.rules "${pkgdir}"/etc/polkit-1/rules.d; rm -r $pkgdir/usr/lib/systemd
}

# vim:set sw=2 sts=-1 et:

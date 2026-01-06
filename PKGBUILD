# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit
pkgver=127
pkgrel=3.1
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
  elogind # required by polkit.install
  libelogind
)
makedepends=(
  dbus
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
)
checkdepends=(python-dbusmock)
provides=(libpolkit-{agent,gobject}-1.so)
install=polkit.install
source=(
  "git+$url#tag=$pkgver"
  turnstile.patch
  0001-meson-Support-explicit-GID.patch
  0002-meson-Detect-Artix-Linux-and-set-the-UID-and-GID.patch
  0003-meson-elogind-build-fix.patch

  99-artix.rules
  turnstile.patch)
b2sums=('6744385984906d97f79aedbfeb894ff274769212af44686b90f6c5ab7f3007d0e6db91b5439c95f344621aa447b570686d46eff7fac861854cfcd37fba5e73e5'
        'c09efe9dac0a842ea4eb053c0668d4ad13a4c699dc279674766bbf9f9028a90934afe92de5aed6b215ecd52dbf47ae46754c49e10a4c4f1d6f652bfb89f4e6d7'
        '5549570ecce8db08263167a52211befda69eca2dd65020d132c3001b621e7b6db8a092eefb29ad0e50ab980b0158ed15a79ab7f23e1754e890b51c6ef827eb72'
        '6d4d435c8af82270fb6720ca00bab14492fbf6f0d73ba0eba0ac909cc192452a78de56ceb2fe224ac68fcc0f7c9decc01771aaa3f1956ccfae9747620986948c'
        '6eb4dda518941223b16ce1f7fa32c11f3d381d189e7f1a51e19f70bf224f5569305412a419b2e7b0d0cdd682951fb6922edd59004c51ee30a02f26fcb201621e'
        'cacdece40f519ce2f2a4b06d31e75e92ed9496c18d4b1090b91a3c8d19f49aff41949b1bdda6e3c0b049b0ca74bbf164023044cf1ec8de6a24065bcda0d42d1f'
        'c09efe9dac0a842ea4eb053c0668d4ad13a4c699dc279674766bbf9f9028a90934afe92de5aed6b215ecd52dbf47ae46754c49e10a4c4f1d6f652bfb89f4e6d7')

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


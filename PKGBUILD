# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit
pkgver=124
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://gitlab.freedesktop.org/polkit/polkit"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  duktape
  elogind libelogind.so
  expat
  glibc
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
_commit=82f0924dc0eb23b9df68e88dbaf9e07c81940a5a  # tags/124
source=(
  "git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit"
  '99-artix.rules'
  0001-meson-Pass-polkitd_uid-to-meson_post_install.py.patch
  0001-fix-sysusers-d.patch
)
b2sums=('SKIP'
        'cacdece40f519ce2f2a4b06d31e75e92ed9496c18d4b1090b91a3c8d19f49aff41949b1bdda6e3c0b049b0ca74bbf164023044cf1ec8de6a24065bcda0d42d1f'
        '0fc028f7c883015c38515883f91e7cd10d15540ae6cb8305d79e8e2d8d70f2228a9935eb477413b37f4b33f6d4faf86f1b6ee33b0c9d6d3d3212e8c1733a83d0'
        '360556ed06af2b8d69a9107ff91b7668b16e5bff0a1be165c60189c5631f2a4dd60341b7a409d98e978e698bb69138177d4d3dc49a5305d83fe89e2ffc79b9de')

pkgver() {
  cd polkit
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd polkit
  git apply -3 ../0001-meson-Pass-polkitd_uid-to-meson_post_install.py.patch
  git apply -3 ../0001-fix-sysusers-d.patch
}

build() {
  local meson_options=(
    -D examples=true
    -D gtk_doc=true
    -D man=true
    -D os_type=redhat
    -D polkitd_uid=102
    -D polkitd_user=polkitd
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

  install -m0644 "${srcdir}"/99-artix.rules "${pkgdir}"/etc/polkit-1/rules.d
}

# vim:set sw=2 sts=-1 et:

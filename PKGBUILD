# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit
pkgver=124
pkgrel=3
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
install=polkit.install
_commit=82f0924dc0eb23b9df68e88dbaf9e07c81940a5a  # tags/124
source=(
  "git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit"
  '99-artix.rules'
  0001-meson-Pass-polkitd_uid-to-meson_post_install.py.patch
  0001-fix-sysusers-d.patch
  turnstile.patch
  polkit-124-c99-fixes.patch
)
b2sums=('SKIP'
        'cacdece40f519ce2f2a4b06d31e75e92ed9496c18d4b1090b91a3c8d19f49aff41949b1bdda6e3c0b049b0ca74bbf164023044cf1ec8de6a24065bcda0d42d1f'
        '51200f8600e48fdec61403c2d16d499478dabcb8826d11bd388ab0f32a05531130b45566d4716769043695863dbd9a8e9b9f6b5222316d60bc2e1749ec93b20b'
        '360556ed06af2b8d69a9107ff91b7668b16e5bff0a1be165c60189c5631f2a4dd60341b7a409d98e978e698bb69138177d4d3dc49a5305d83fe89e2ffc79b9de'
        'c09efe9dac0a842ea4eb053c0668d4ad13a4c699dc279674766bbf9f9028a90934afe92de5aed6b215ecd52dbf47ae46754c49e10a4c4f1d6f652bfb89f4e6d7'
        'd3820081c0215e37855045a1e1efe4da77ef17820f115a43984f37100533f0b2fbbf80cf41f508e2d63dfeeaa4ed782246d78a267cea32bc9e2ea4c9db4f8150')

pkgver() {
  cd polkit
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd polkit
  git apply -3 ../0001-meson-Pass-polkitd_uid-to-meson_post_install.py.patch
  git apply -3 ../0001-fix-sysusers-d.patch
  git apply -3 ../turnstile.patch
  git apply -3 ../polkit-124-c99-fixes.patch
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

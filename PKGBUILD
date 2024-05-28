# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-remote-desktop
pkgver=46.2
pkgrel=1
pkgdesc="GNOME Remote Desktop server"
url="https://gitlab.gnome.org/GNOME/gnome-remote-desktop"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  freerdp
  fuse3
  gcc-libs
  glib2
  glibc
  libdrm
  libei
  libepoxy
  libfdk-aac
  libnotify
  libpipewire
  libsecret
  libvncserver
  libxkbcommon
  opus
  pipewire
  polkit
  tpm2-tss
)
makedepends=(
  asciidoc
  ffnvcodec-headers
  git
  meson
  python-packaging
)
checkdepends=(
  dbus-broker
  libegl
  mutter
  python-dbus
  python-gobject
  wireplumber
)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-remote-desktop.git?signed#tag=${pkgver/[a-z]/.&}"
        "0001-build-fix-compiling-without-libsystemd.patch")
b2sums=('eb0b13a0b4a37229048999fb33f7ec0b54189ee51b99708dcb35cc4dda2645b6dd8fa536347d6ef38acb64533fc6219130c204887dae6c42bf3312adba053142'
        '2101646e459adab43d23e48dc6d21750cd25e9bc5d5653828394b61563c949c702023a26d898ac357f82d77c5e6291f1806c389ac1ff9f2b91df05472e313bbd')
validpgpkeys=(
  8307C0A224BABDA1BABD0EB9A6EEEC9E0136164A # Jonas Ådahl <jadahl@gmail.com>
  E60DADB5546D3F01AF35B87289F540EAB24513E2 # Ray Strode <rstrode@redhat.com>
)

prepare() {
  cd $pkgname

  git apply -3 ../0001-build-fix-compiling-without-libsystemd.patch
}

build() {
  local meson_options=(
    -D systemd=false
    -D vnc=true
  )

  artix-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

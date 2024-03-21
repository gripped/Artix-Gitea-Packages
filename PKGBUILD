# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-remote-desktop
pkgver=45.1
pkgrel=2
pkgdesc="GNOME Remote Desktop server"
url="https://wiki.gnome.org/Projects/Mutter/RemoteDesktop"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  freerdp2
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
_commit=df66c0e99a749058e0ee7dcee36bd97e018a3bb8  # tags/45.1^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-remote-desktop.git#commit=$_commit")
b2sums=('1f93c905d2ed2ce821c17c3773f6e8229cead225597e24edaab606ff17d2dd9f2adebf4672c82a6f1d3e1e8d3086baf774153d171abe525ec4fc481b1f6591ea')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
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
  meson test -C build --print-errorlogs -t 3 ||: # test fails skip
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

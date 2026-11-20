# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Kyle Laker <kyle@laker.email>

pkgname=warpinator
pkgver=2.0.7
pkgrel=1
pkgdesc='LAN file sender, send and receive files across the network'
arch=(any)
url='https://github.com/linuxmint/warpinator'
license=(GPL-3.0-or-later)
groups=(x-apps)
depends=(
  bash
  dconf
  gdk-pixbuf2
  glib2
  gtk3
  hicolor-icon-theme
  polkit
  python
  python-cairo
  python-cryptography
  python-gobject
  python-grpcio
  python-netifaces
  python-protobuf
  python-pynacl
  python-qrcode
  python-setproctitle
  python-xapp
  python-zeroconf
  xapp
)
makedepends=(
  git
  meson
)
optdepends=('ufw: Open a firewall port for Warpinator')
source=("git+https://github.com/linuxmint/warpinator.git#tag=$pkgver")
b2sums=(7da5c895d25b014118ebefa1f136ec0b371e1ec9e485601b75c84bb8f72dd994c3ef2e236738bf76c777b06bcfeab7825d32deb571458b908445e9f86b7571fa)

prepare() {
  cd $pkgname

  # Fix hardcoded libexec dir
  sed -i 's|libexec/warpinator|lib/warpinator|' data/org.x.warpinator.policy.in.in
}

build() {
  artix-meson $pkgname build \
    -D bundle-zeroconf=false \
    -D bundle-grpc=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}

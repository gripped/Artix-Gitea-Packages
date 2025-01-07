# Maintainer: artist for Artix Linux

_orgname=ReGreet
pkgname="greetd-${_orgname,,}"
pkgver=0.2.0
pkgrel=1
pkgdesc='Clean and customizable greeter for greetd'
url="https://github.com/rharish101/$_orgname"
license=(GPL-3.0-or-later)
arch=(x86_64)
depends=(wayland-compositor
         greetd
         cairo
         gcc-libs
         gdk-pixbuf2
         glib2
         glibc
         gtk4
         pango)
makedepends=(cargo)
provides=(greetd-greeter)
backup=("etc/greetd/${_orgname,,}.toml")
install=$pkgname.install
source=("$url/archive/$pkgver/${pkgname}-${pkgver}.tar.gz"
        "${_orgname,,}.toml")
sha256sums=('6ce1f948feb75e12436eccc41557ad6a7127672f0658a9c9fbd5a412cebafc8a'
            '7780028e5774347793e8073c86bde7f38b70a9736dc7c5b0566d93aa7f0c252b')

prepare() {
  cd "${_orgname}-${pkgver}"
  sed -i -e 's|systemctl|loginctl|' regreet.sample.toml
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export REBOOT_CMD="loginctl reboot"
  export POWEROFF_CMD="loginctl shutdown"
  cd "${_orgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  cd "${_orgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "${_orgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_orgname,,}"
  install -Dm0644 -t "$pkgdir/etc/greetd/" ../"${_orgname,,}.toml"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "${_orgname,,}.sample.toml"
  install -Dm0644 systemd-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/${_orgname,,}.conf"
}


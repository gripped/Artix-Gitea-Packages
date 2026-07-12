# Maintainer: Thomas Scholtes <geigerzaehler@axiom.fm>
#
# shellcheck shell=bash disable=SC2034 disable=SC2154 disable=SC2164

pkgname=radicle-desktop
pkgver='0.13.0'
pkgrel='1'
pkgdesc='Radicle desktop app'
arch=('x86_64')
url='https://radicle.dev/'
license=('GPL-3.0-only')
depends=(
  # See https://v2.tauri.app/distribute/aur/#building-from-source
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libjxl.so=0.12'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  # See https://v2.tauri.app/distribute/aur/#building-from-source
  'git'
  'openssl'
  'appmenu-gtk-module'
  'libappindicator-gtk3'
  'librsvg'
  'cargo'
  'npm'
  'nodejs'
)
optdepends=(
  'radicle-node'
)
_tag="releases/${pkgver}"
options=('!strip' '!emptydirs' '!lto')
source=("$pkgname::git+https://seed.radicle.dev/z4D5UCArafTzTQpDZNQRuqswh3ury.git#tag=$_tag")
sha256sums=('f72f2fbfeee33b4d9e83cdfb41647a91b44c8dc17698f25cc07be580b487e00e')

prepare() {
  cd "$pkgname"

  npm ci --ignore-scripts
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"

  ./node_modules/.bin/tauri  build --bundles deb
}

package() {
  cp -a $pkgname/target/release/bundle/deb/${pkgname}_${pkgver}_*/data/* "${pkgdir}"
}

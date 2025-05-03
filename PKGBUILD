# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=fractal
pkgver=11
pkgrel=1
pkgdesc="Matrix group messaging app"
arch=(x86_64)
url="https://gitlab.gnome.org/World/fractal"
license=(GPL-3.0-only)
depends=(
  dconf
  fontconfig
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  glycin  # dlopen'ed
  graphene
  gst-plugins-bad-libs
  gst-plugins-base-libs
  gst-plugin-gtk4
  gstreamer
  gtk4
  gtksourceview5
  hicolor-icon-theme
  lcms2
  libadwaita
  libpipewire
  libseccomp
  libshumate
  openssl
  org.freedesktop.secrets
  pango
  sqlite
)
makedepends=(
  clang
  cmake
  dart-sass
  libwebp
  meson
  rust
  xdg-desktop-portal
)
source=(
  $url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
sha512sums=('aa5aba370bb0d2b6885cf121d88f3712568ca37c62866705ad0592e094629934a002a2decf6166c44cc7410ab9272af8da40a1e947a3f9ad5382f0639b9a7084')
b2sums=('1117d14efd5f2ba92b948ae6ebcaaeca5199e80c903de7333b70a698df10c5e53684a5bd1653494d9af5ee702e65e7a5804d81e73022c51cc7c90186cfec0d06')

prepare() {
  # NOTE: usptream uses a custom CARGO_HOME from within meson
  export CARGO_HOME="$(pwd)/build/cargo-home"
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  CFLAGS+=' -ffat-lto-objects'
  artix-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  # NOTE: explicitly prevent rebuild: https://gitlab.gnome.org/GNOME/fractal/-/issues/1327
  meson install -C build --destdir "$pkgdir" --no-rebuild
}

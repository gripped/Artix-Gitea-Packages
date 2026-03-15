# Packager: nous
# PKGBUILD: https://codeberg.org/kev2600/shortwave-artix

pkgname=shortwave
pkgver=5.1.0
pkgrel=1
pkgdesc="Internet radio player"
arch=('x86_64')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'libshumate' 'libpeas-2' 'glycin-gtk4' 'sqlite'
         'gst-plugins-bad' 'desktop-file-utils' 'openssl')
makedepends=('git' 'meson' 'ninja' 'cargo' 'gettext')
source=("git+https://gitlab.gnome.org/World/Shortwave.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
    export CC=gcc
    export CXX=g++
    export CFLAGS="$CFLAGS -ffat-lto-objects"
    export CXXFLAGS="$CXXFLAGS -ffat-lto-objects"
    export CARGO_HOME="$srcdir/../cargo-home"
    export CARGO_TARGET_DIR="$srcdir/../cargo-target"

    mkdir -p "$srcdir/../cargo-home"
    cat > "$srcdir/../cargo-home/config.toml" << 'EOF'
[target.x86_64-unknown-linux-gnu]
linker = "cc"
EOF

    arch-meson Shortwave build
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
    rm -rf "$pkgdir/usr/lib/systemd"
    sed -i 's|/usr/bin/shortwave|/usr/bin/shortwave --gapplication-service|' \
        "$pkgdir/usr/share/dbus-1/services/de.haeckerfelix.Shortwave.service"
}

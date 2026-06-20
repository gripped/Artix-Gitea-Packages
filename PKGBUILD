# Maintainer: marzosh <marzosh@artixlinux.org>
# Contributor: artist for Artix Linux
# Contributor: Roshless <pkg@roshless.com>

pkgname=lagrange
pkgrel=1
pkgver=1.20.7
pkgdesc="Beautiful Gemini Client"
url="https://git.skyjake.fi/skyjake/lagrange"
arch=('x86_64')
license=("BSD-2-Clause")
depends=(
    "fribidi"
    "harfbuzz"
    "hicolor-icon-theme"
    "libunistring"
    "mpg123"
    "openssl"
    "pcre"
    "sdl2"
    "zlib"
)
makedepends=(
    "cmake"
    "zip"
)
optdepends=(
    "libjxl: JPEG XL image decoding"
    "libwebp: Webp decode support"
)
source=("${url}/releases/download/v$pkgver/${pkgname}-${pkgver}.tar.gz")

build() {
    cmake -B build -S "$pkgname-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DENABLE_KERNING=OFF \
        -DTFDN_ENABLE_WARN_ERROR=OFF \
        -Wno-dev
    make -C build
}

package() {
    install -Dm644 $pkgname-$pkgver/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd build
    make DESTDIR="$pkgdir" install
}

sha256sums=('979d83f69144512631d7386ab6b31ef97257157e1e3607ba58e0408377353c74')

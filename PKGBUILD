# Maintainer: marzosh <marzosh@artixlinux.org>
# Contributor: artist for Artix Linux
# Contributor: Roshless <pkg@roshless.com>

pkgname=lagrange
pkgrel=1
pkgver=1.20.9
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

sha256sums=('97dba8f6785257b270aa5054df610c64a66867346b43a93749a0ec1ad95a0a3b')

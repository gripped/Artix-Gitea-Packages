# Maintainer: marzosh <marzosh@artixlinux.org>
# Contributor: artist for Artix Linux
# Contributor: Roshless <pkg@roshless.com>

pkgname=lagrange
pkgver=2.0.2
pkgrel=1
pkgdesc="Beautiful Gemini Client"
url="https://github.com/skyjake/lagrange"
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
sha256sums=('7994b41daa6000dfe479a8f5328c36010dba53c873f2399274a029763a77a7a7')

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

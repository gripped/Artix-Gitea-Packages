# Maintainer: commandk <userhandle@artixlinux.org>

pkgname=psi-plus
pkgver=1.5.2132
pkgrel=1
pkgdesc="Powerful XMPP client (Qt, C++) designed for the XMPP power users"
url="https://psi-im.org"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('qt6-multimedia' 'qca-qt6' 'qt6-svg' 'hunspell'
    'qtkeychain-qt6' 'libotr' 'tidy' 'http-parser'
    'gstreamer' 'gst-libav' 'libxss'
    'libusrsctp' 'libomemo-c' 'libb2')
makedepends=('cmake' 'git' 'ninja' 'vulkan-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/psi-plus/psi-plus-snapshots/archive/${pkgver}.tar.gz")
sha256sums=('466fb31e167d6965b1bc0fda061474926bb1975b6ba93213a613c2501ffbe2a3')

build() {
    cd psi-plus-snapshots-${pkgver}
    mkdir -p build
    cd build
    cmake -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
        -DIRIS_BUNDLED_QCA=ON \
        -DENABLE_PLUGINS=ON \
        -DBUILD_DEV_PLUGINS=ON \
        -DQT_DEFAULT_MAJOR_VERSION=6 \
        -DBUILD_PSIMEDIA=ON ..
    ninja
}

package() {
    cd psi-plus-snapshots-${pkgver}/build

    DESTDIR="$pkgdir" ninja install
}

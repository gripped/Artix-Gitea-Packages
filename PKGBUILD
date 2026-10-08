# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=rpi-imager
pkgver=2.0.12
pkgrel=1
pkgdesc="Raspberry Pi Imaging Utility"
depends=(
    'curl'
    'glibc'
    'gnutls'
    'hicolor-icon-theme'
    'libarchive'
    'libgcc'
    'libstdc++'
    'liburing'
    'libusb'
    'polkit'
    'qt6-base'
    'qt6-declarative'
    'xz'
    'zstd'
)
optdepends=(
    'dosfstools: SD card bootloader support'
)
makedepends=(
    'git'
    'cmake'
    'qt6-tools'
    'qt6-svg'
)
arch=('x86_64')
url="https://github.com/raspberrypi/rpi-imager"
license=("Apache-2.0")

source=("git+https://github.com/raspberrypi/rpi-imager.git#tag=v${pkgver}"
        "remove-vendoring.patch"
        "set-archlinux-version-suffix.patch")

b2sums=('1ecd353f4d1e25cbf21dab431d7754d9bc1e20a2aa2b2769a932fc59fbf07b9d3f70186f8e26f1c6e25653eb4aac5a67c1af3158dd2159f8c228d1bb3d0990e4'
        'c74100eb29fce2bd5e54e4b7b96475b2e024e28d09098aeee573099034eaf5c406cf2e638fce85758d97ace92a35238b9fbcbe073fdf7084bbda40e900ec9a6a'
        'c9b47da8b73c5838a1b0636fc76d58a999c05b2a785d9bfc070adb1e39ea44def6798b58e663f30c92a395f3df488e995ae8586b16e1c81f94d5d07e1a84418b')

prepare() {
    cd "${pkgname}" 
    # https://github.com/raspberrypi/rpi-imager/issues/924
    patch -Np1 -i "$srcdir/remove-vendoring.patch"
    patch -Np1 -i "$srcdir/set-archlinux-version-suffix.patch"
}

build() {
    local cmake_options=(
        -B build
        -S "${pkgname}/src"
        -Wno-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D ENABLE_CHECK_VERSION=OFF
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 ${srcdir}/${pkgname}/doc/man/rpi-imager.1 "${pkgdir}/usr/share/man/man1/rpi-imager.1"
    install -Dm644 ${srcdir}/${pkgname}/debian/changelog "${pkgdir}/usr/share/doc/rpi-imager/changelog"
    install -Dm644 ${srcdir}/${pkgname}/debian/com.raspberrypi.rpi-imager.policy "${pkgdir}/usr/share/polkit-1/actions/com.raspberrypi.rpi-imager.policy"
    install -Dm644 ${srcdir}/${pkgname}/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

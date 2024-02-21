# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares
pkgver=3.3.2
pkgrel=1
pkgdesc='Distribution-independent installer framework'
arch=('x86_64')
license=(
    'BSD-2-Clause'
    'CC-BY-4.0'
    'CC0-1.0'
    'GPL-3.0-or-later'
    'LGPL-2.1-only'
    'LGPL-3.0-or-later'
    'MIT')
url="https://github.com/calamares/calamares"
license=('LGPL')
depends=('bash' 'glibc' 'gcc-libs' 'hwinfo' 'icu' 'libxcrypt' 'libpwquality' 'parted' 'yaml-cpp'
        'qt5-base' 'qt5-svg' 'qt5-declarative' 'qt5-location' 'qt5-xmlpatterns'
        'kconfig5' 'kcoreaddons5' 'kcrash5' 'kparts5' 'kpackage5' 'plasma-framework5' 'kpmcore'
        'gtk-update-icon-cache' 'polkit-qt5' 'ckbcomp' 'python'
        'python-jsonschema' 'python-toml' 'python-pyyaml'
        'hicolor-icon-theme') #'appstream-qt5'
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-translations')
provides=('libcalamares.so' 'libcalamaresui.so')
optdepends=('calamares-extensions: Artix extensions and branding')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('87dd5d242dc2a667f4448802cc135916b134fc4fd1f4917fa9268b116adc6065')

build() {
    mkdir -p "$pkgname-$pkgver"/build
    cd "$pkgname-$pkgver"/build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_PREFIX_PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DINSTALL_CONFIG:BOOL=ON \
        -DINSTALL_POLKIT:BOOL=ON \
        -DBUILD_APPDATA:BOOL=OFF \
        -DBUILD_APPSTREAM:BOOL=OFF \
        -DSKIP_MODULES="\
            packagechooser \
            packagechooserq \
            services-systemd \
            oemid \
            initramfs \
            initramfscfg \
            tracking \
            interactiveterminal \
            dummyprocess \
            dummypython \
            dummycpp \
            dummypythonqt"
    make
}

package() {
    make -C "$pkgname-$pkgver"/build DESTDIR="$pkgdir" install
}

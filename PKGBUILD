# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares
pkgver=3.3.13
pkgrel=2
pkgdesc='Distribution-independent installer framework'
arch=('x86_64')
url="https://github.com/calamares/calamares"
license=(
    'BSD-2-Clause'
    'CC-BY-4.0'
    'CC0-1.0'
    'GPL-3.0-or-later'
    'LGPL-2.1-only'
    'LGPL-3.0-or-later'
    'MIT')
depends=('bash' 'glibc' 'gcc-libs' 'hwinfo' 'icu' 'libxcrypt' 'libpwquality'
        'parted' 'yaml-cpp' 'qt6-base' 'qt6-svg' 'qt6-declarative' 'qt6-location'
        'kirigami' 'kcoreaddons' 'kconfig' 'kcrash' 'kparts' 'kpackage'
        'plasma-integration' 'kpmcore' 'polkit-qt6'
        'gtk-update-icon-cache' 'ckbcomp' 'python'
        'python-jsonschema' 'python-toml' 'python-pyyaml'
        'hicolor-icon-theme') #'appstream-qt6'
makedepends=('extra-cmake-modules' 'qt6-tools' 'qt6-translations')
provides=('libcalamares.so' 'libcalamaresui.so')
optdepends=('calamares-extensions: Artix extensions and branding')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
        cmake-appstream-helper-fix.patch)
sha256sums=('18094f5dd473c67ff1098a906f8bec4875852026c278dfd911c2819e3656625b'
            '3f4860574bbffd4eca4d449bc1256fcf7e01be21cd8b31f3a608a8cd350abd82')

prepare() {
    patch -d "$pkgname-$pkgver" -Np 1 -i ../cmake-appstream-helper-fix.patch
}

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_PREFIX_PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DINSTALL_CONFIG:BOOL=ON \
        -DINSTALL_POLKIT:BOOL=ON \
        -DBUILD_APPDATA:BOOL=OFF \
        -DBUILD_APPSTREAM:BOOL=OFF \
        -DWITH_QT6:BOOL=ON \
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

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$pkgname-$pkgver"/LICENSES/{MIT,BSD-2-Clause}.txt -t "$pkgdir"/usr/share/licenses/"$pkgname"
}

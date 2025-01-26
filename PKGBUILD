# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares
pkgver=3.3.13
pkgrel=3
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
makedepends=('extra-cmake-modules' 'qt6-tools' 'qt6-translations' 'git')
provides=('libcalamares.so' 'libcalamaresui.so')
optdepends=('calamares-extensions: Artix extensions and branding')
source=(
        "git+https://github.com/calamares/calamares.git#tag=v$pkgver"
        # "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
        # cmake-appstream-helper-fix.patch
        0001-packagechooser-customize-qrc.patch
        0002-if-license.patch
        0003-packagechooser-add-if-png.patch

        )
sha256sums=('8d0146ddc8af4368496fc6d965d7e30dcb55cbb9c2cef0c79a08d24c35094676'
            '893e55d56557bc422cab095f9d303863240d883797e3920ff5a165b3618bb29d'
            'f95255cd446a8887d41698c6da7d3d5147afa98ba775930f1cce64c21300b7ba'
            '9cc8e5172171681eec810ce7d259995a9e3bcabe9ef46772c8f1c35040f8f5fd')

prepare() {
    cd $pkgname
    git apply ../0001-packagechooser-customize-qrc.patch
    git apply ../0002-if-license.patch
    git apply ../0003-packagechooser-add-if-png.patch

    # patch -d "$pkgname-$pkgver" -Np 1 -i ../cmake-appstream-helper-fix.patch
}

build() {
    cmake -S "$pkgname" -B build \
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

    install -Dm644 "$pkgname"/LICENSES/{MIT,BSD-2-Clause}.txt -t "$pkgdir"/usr/share/licenses/"$pkgname"
}

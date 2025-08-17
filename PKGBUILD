# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

_artix_url=https://gitea.artixlinux.org/artix/calamares

pkgname=calamares
pkgver=3.3.14
pkgrel=3
pkgdesc='Distribution-independent installer framework'
arch=('x86_64')
url="https://codeberg.org/Calamares/calamares"
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
        "git+${url}.git#tag=v$pkgver"
        0001-packagechooser-customize-qrc.patch
        0002-if-license.patch
        0003-packagechooser-add-if-png.patch
        0001-btrfs-fix-crc32c-module-loading.patch
)
sha256sums=('e06f8d5d185120ce3c02ea94137eb51e84a76bb8f5b09be7e9f6e9129c0f81af'
            '893e55d56557bc422cab095f9d303863240d883797e3920ff5a165b3618bb29d'
            'f95255cd446a8887d41698c6da7d3d5147afa98ba775930f1cce64c21300b7ba'
            '9cc8e5172171681eec810ce7d259995a9e3bcabe9ef46772c8f1c35040f8f5fd'
            'ddf42142a1127af099313134912cb5a5c1b1e6afe1469cb5eb14f864cd779cb1')

prepare() {
    cd $pkgname
    git apply ../0001-packagechooser-customize-qrc.patch
    git apply ../0002-if-license.patch
    git apply ../0003-packagechooser-add-if-png.patch
    git apply ../0001-btrfs-fix-crc32c-module-loading.patch
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

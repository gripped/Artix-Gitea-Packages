# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares
pkgver=3.3.0
pkgrel=13
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
        'gtk-update-icon-cache' 'polkit-qt5' 'ckbcomp' #'appstream-qt5'
        'python-jsonschema' 'python-toml' 'python-pyyaml' 'python'
        'hicolor-icon-theme' 'artix-icons'
        )
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-translations')
optdepends=('calamares-extensions: Artix extensions and branding')
source=("$pkgname-$pkgver.tar.gz::https://github.com/calamares/calamares/archive/refs/tags/v${pkgver}.tar.gz"
        0001-fix-extensions-build.patch::https://gitea.artixlinux.org/artix/calamares/commit/e7d8f6fbb0726b3e03ed6a05b9bbb926465baa13.patch)
sha256sums=('252f0097e3191ffc557b022f34ef23d24b939f1141efd483db0ab1ee9dc0fb76'
            '5e9698e5925330e06e651d124f356fae2c65bbe6757ed3ae64608fa6d58dc9bc')

prepare() {
    patch -d "$pkgname-$pkgver" -Np 1 -i ../0001-fix-extensions-build.patch
}

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
            -DSKIP_MODULES="packagechooser packagechooserq services-systemd oemid \
                            initramfs initramfscfg finishedq keyboardq localeq \
                            notesqml summaryq usersq welcomeq tracking interactiveterminal \
                            dummyprocess dummypython dummycpp dummypythonqt"
    make
#             -DBUILD_APPDATA:BOOL=ON
#             -DBUILD_APPSTREAM:BOOL=ON
}

package() {
    make -C $pkgname-$pkgver/build DESTDIR="$pkgdir" install

    sed -e 's|Icon.*=.*|Icon=artixlinux-logo|g' \
        -i "$pkgdir"/usr/share/applications/calamares.desktop
}

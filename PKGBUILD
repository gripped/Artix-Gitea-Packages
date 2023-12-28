# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=calamares
pkgver=3.3.0
_tag='8e08d07afd39ae0663b01db75e8c828331924f99' # git rev-parse v${pkgver}
pkgrel=12
pkgdesc='Distribution-independent installer framework'
arch=('x86_64')
license=(GPL)
url="https://github.com/calamares/calamares"
license=('LGPL')
depends=('bash' 'glibc' 'gcc-libs' 'hwinfo' 'icu' 'libxcrypt' 'libpwquality' 'parted' 'yaml-cpp'
        'qt5-base' 'qt5-svg' 'qt5-declarative' 'qt5-location' 'qt5-xmlpatterns'
        'kconfig5' 'kcoreaddons5' 'kcrash5' 'kparts5' 'kpackage5' 'plasma-framework5' 'kpmcore'
        'gtk-update-icon-cache' 'polkit-qt5' 'ckbcomp' #'appstream-qt5'
        'python-jsonschema' 'python-toml' 'python-pyyaml' 'python'
        'hicolor-icon-theme' 'artix-icons'
        )
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-translations' 'git')
optdepends=('calamares-branding: Artix branding')
source=(calamares-artix::git+https://gitea.artixlinux.org/artix/calamares.git#tag=v${pkgver}
        packagechooser-if-img.patch)
sha256sums=('SKIP'
            '8937d8f7bda17b39a86ede1c7b3222494471b5c911cccfe4b12bef0bbaf1e5f8')

_patches=(
    041dcd2983190ed57d6cb57e906ae6abc9082c57 # postcfg
    abf3b6976688acb627db8d2e68230e386edbf1a2 # services-s6
    59bde93b913b7948c1d08a1f2f5ac3cc95d8a6e4 # services-dinit
    1eba5ba9594a8816fde0316794e7ec41aca97212 # services-runit
    12f98c759a34c658091d9bd72f31093d13e89098 # basestrap
    d6691aea6bf28e9516b8d2c55b986eadb778ba44 # services-artix
    98a19d20aae5ea04a4b857b4f3c4cc52b4e31358 # packagechooser
)

prepare() {
    cd "$pkgname"-artix

    local _c
    for _c in "${_patches[@]}"; do
        git log --oneline -1 "${_c}"
        git cherry-pick -n "${_c}"
    done

    git apply --binary $srcdir/packagechooser-if-img.patch
}

build() {
    cd $pkgname-artix

    mkdir -p build
#             -DBUILD_APPDATA:BOOL=ON \
#             -DBUILD_APPSTREAM:BOOL=ON \
    cd build
        cmake .. \
              -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DCMAKE_PREFIX_PATH=/usr \
              -DCMAKE_INSTALL_LIBDIR=lib \
              -DINSTALL_CONFIG:BOOL=ON \
              -DINSTALL_POLKIT:BOOL=ON \
              -DSKIP_MODULES="initramfs \
                              initramfscfg services-systemd \
                              dummyprocess dummypython dummycpp dummypythonqt"
        make
}

package() {
    cd $pkgname-artix/build
    make DESTDIR="$pkgdir" install

    sed -e 's|Icon.*=.*|Icon=artixlinux-logo|g' \
        -i "$pkgdir"/usr/share/applications/calamares.desktop
}

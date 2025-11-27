# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: MatMoul <matmoul at the google email domain which is .com>

_url=https://gitea.artixlinux.org/artix/octopi

pkgbase=octopi
pkgname=(octopi octopi-notifier)
pkgver=0.18.1
pkgrel=2
pkgdesc='This is Octopi, a powerful Pacman frontend using Qt libs'
arch=('x86_64')
license=('GPL-2.0-or-later')
url="https://tintaescura.com/projects/octopi/"
makedepends=(
    qt6-tools
    qt6-5compat
    qt-sudo
    cmake
    kstatusnotifieritem
    liboctopi
    pacman
    pacman-contrib
    git
)
depends=(
    glibc
    gcc-libs
    qt6-base
    qt6-multimedia
    qtermwidget
)
source=(
    "git+https://github.com/aarnt/octopi.git#tag=v$pkgver"
    "$pkgbase-$pkgver-use-liboctopi.patch::$_url/commit/c1b25f836655801965c088e0889f4625b6981c11.patch"
    "$pkgbase-$pkgver-qt-sudo-config.patch::$_url/commit/df63eb937131e8de96d02a4e3c122c6b6aa16e54.patch"
)
sha256sums=('85d2c578cf75df8e2cdf7622f245756881679c998971c77c2a5f7034d786d652'
            '0fcd1e0ba9f7a078131204e9124de6125b081c311b0d27f0541eff5777ab9f2e'
            '3405f5bcea260af3d1549bce94572f7d13559a32bebb12b6fae79ac0f7cb5b92')

prepare() {
    cd "$pkgbase"
    git apply ../"$pkgbase-$pkgver"-use-liboctopi.patch
    git apply ../"$pkgbase-$pkgver"-qt-sudo-config.patch

    cp resources/images/octopi_green.png resources/images/octopi.png
}

build() {
    cmake -S "$pkgbase" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_KF6NOTIFICATIONS=ON
    cmake --build build
}

package_octopi() {
    depends+=(
        liboctopi liboctopi.so
        pacman libalpm.so
        pacman-contrib
        qt-sudo
    )
    optdepends=(
        'octopi-notifier: Notifier for Octopi with Knotifications support'
        'trizen: AUR support'
    )
    provides=(
        'octopi-repoeditor'
        'octopi-cachecleaner'
    )

    DESTDIR="$pkgdir" cmake --install build

    install -d _octopi-notifier/usr/{share/applications,bin}
    mv -v "$pkgdir"/usr/share/applications/octopi-notifier.desktop _octopi-notifier/usr/share/applications/
    mv -v "$pkgdir"/usr/bin/octopi-notifier _octopi-notifier/usr/bin/
}

package_octopi-notifier() {
    pkgdesc+=' (notifier)'
    depends+=(
        liboctopi liboctopi.so
        pacman libalpm.so
        octopi
        kstatusnotifieritem
    )
    provides=(
        'octopi-notifier-frameworks'
    )
    conflicts=(
        'octopi-notifier-frameworks'
    )
    replaces=(
        'octopi-notifier-frameworks'
    )

    mv -v _octopi-notifier/* "$pkgdir"/
}

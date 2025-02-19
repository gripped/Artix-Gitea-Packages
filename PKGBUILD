# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: MatMoul <matmoul at the google email domain which is .com>

_url=https://gitea.artixlinux.org/artix/octopi

pkgbase=octopi
pkgname=(octopi octopi-notifier)
pkgver=0.17.0
pkgrel=3
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
    qt6-multimedia
)
depends=(
    glibc
    gcc-libs
    qt6-base
    qtermwidget
)
source=(
    "git+https://github.com/aarnt/octopi.git#tag=v$pkgver"
    "$pkgbase-$pkgver-use-liboctopi.patch::$_url/commit/83a7d3359ba876dc482ab83c1cbb56d47e2a8c6a.patch"
    "$pkgbase-$pkgver-qt-sudo-config.patch::$_url/commit/df63eb937131e8de96d02a4e3c122c6b6aa16e54.patch"
)
sha256sums=('25c0e9432af3cab658db40bdf4db15c38b1237f6ee24e859e926c75abbeb8234'
            '058ac6af1ae720b1a99e0fc3980a4cd1a4f4acb210c3a83227006f554a23ffed'
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

# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: MatMoul <matmoul at the google email domain which is .com>

_url=https://gitea.artixlinux.org/artix/octopi
#_itag=1

pkgbase=octopi
pkgname=(octopi octopi-notifier-frameworks)
pkgver=0.16.2
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
    qtermwidget
)
source=(
    "git+https://github.com/aarnt/octopi.git#tag=v$pkgver"
    "$pkgbase-$pkgver-qt-sudo-config.patch::$_url/commit/df63eb937131e8de96d02a4e3c122c6b6aa16e54.patch"
    $pkgbase-$pkgver-use-liboctopi.patch::$_url//commit/25f8b1970891d0b304f3533148bf5dc849ba3da9.patch
    #"git+https://gitea.artixlinux.org/artix/octopi-images.git#tag=$_itag"
)
sha256sums=('fca95cdcc8f5318104e87fd81e10cdda671523dabad9f903159759a4d74c3bfa'
            '3405f5bcea260af3d1549bce94572f7d13559a32bebb12b6fae79ac0f7cb5b92'
            '3006cc0775080e797aaf0a36b49a21a526971f77d57e44420b1561453cb9c4f2')

prepare() {
    cd "$pkgbase"

    git apply ../"$pkgbase-$pkgver"-use-liboctopi.patch
    git apply ../"$pkgbase-$pkgver"-qt-sudo-config.patch

    #cp ../octopi-images/images/octopi_{green,red,yellow,transparent}.png resources/images/

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
        'octopi-notifier-frameworks: Notifier for Octopi with Knotifications support'
        'trizen: for AUR support'
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

package_octopi-notifier-frameworks() {
    pkgdesc+=' (notifier)'
    depends+=(
        liboctopi liboctopi.so
        pacman libalpm.so
        octopi
        kstatusnotifieritem
    )
    provides=('octopi-notifier')

    mv -v _octopi-notifier/* "$pkgdir"/
}

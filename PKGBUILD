# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: MatMoul <matmoul at the google email domain which is .com>

pkgbase=octopi
pkgname=(octopi octopi-notifier-frameworks)
pkgver=0.15.0
pkgrel=10
pkgdesc='This is Octopi, a powerful Pacman frontend using Qt libs'
arch=('x86_64')
license=('GPL-2.0-or-later')
url="https://tintaescura.com/projects/octopi/"
makedepends=(
    qt6-tools
    cmake
    kstatusnotifieritem
    sudo
    alpm-octopi-utils
    pacman
    pacman-contrib
    git
)
depends=(
    glibc
    gcc-libs
    qt6-base
    qtermwidget-qt6
)
source=(
    git+https://github.com/aarnt/octopi.git#tag=v$pkgver
    kf6-fix.patch::https://gitea.artixlinux.org/artoo/octopi/commit/2bc37ecd570baaf0e69e878c60a93993136da40d.patch
    window.patch::https://gitea.artixlinux.org/artoo/octopi/commit/f0b15ef621f21eb3cad1c18d0b928d37eb732b97.patch
    notifier-fix.patch::https://github.com/aarnt/octopi/commit/64e72f06c9ae9c844b92977e036865d90339b87d.patch
)
sha256sums=('SKIP'
            'bdd9fd77d254894147fb68962574977e4a7944304e585f8fb792a98b27c5b246'
            '7eb66605f838ac78848fe067dded279c2d45ba0e5f1a8295cf07c0a3b333e702'
            'e4f07a252fb966ddc703692d41d3e259f181efbe5ba5eeff0236fac954b0672f')

prepare() {
    cd "$pkgbase"
    git apply ../kf6-fix.patch
    git apply ../window.patch
    git apply ../notifier-fix.patch
    cp resources/images/octopi_green.png resources/images/octopi.png
}

build() {
    cmake -S "$pkgbase" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_QTERMWIDGET6=ON \
        -DUSE_KF6NOTIFICATIONS=ON
    cmake --build build
}

package_octopi() {
    depends+=(
        alpm-octopi-utils libalpm_octopi_utils.so
        pacman libalpm.so
        pacman-contrib
        sudo
    )
    optdepends=(
        'octopi-notifier-frameworks: Notifier for Octopi with Knotifications support'
        # 'pacmanlogviewer: to view pacman log files'
        # 'pacaur: for AUR support'
        # 'paru: for AUR support'
        # 'pikaur: for AUR support'
        'trizen: for AUR support'
        # 'yay: for AUR support'
    )
    provides=(
        'octopi-repoeditor'
        'octopi-cachecleaner'
    )

    DESTDIR="$pkgdir" cmake --install build

    install -d _octopi-notifier/{/etc/xdg/autostart,usr/{share/applications,bin}}
    mv -v "$pkgdir"/etc/xdg/autostart/octopi-notifier.desktop _octopi-notifier/etc/xdg/autostart/
    mv -v "$pkgdir"/usr/share/applications/octopi-notifier.desktop _octopi-notifier/usr/share/applications/
    mv -v "$pkgdir"/usr/bin/octopi-notifier _octopi-notifier/usr/bin/
    rm -rv "$pkgdir"/etc
}

package_octopi-notifier-frameworks() {
    pkgdesc+=' (notifier)'
    depends+=(
        alpm-octopi-utils libalpm_octopi_utils.so
        pacman libalpm.so
        octopi
        kstatusnotifieritem
    )
    provides=('octopi-notifier')

    mv -v _octopi-notifier/* "$pkgdir"/
}

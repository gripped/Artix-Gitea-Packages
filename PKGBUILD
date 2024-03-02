# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: MatMoul <matmoul at the google email domain which is .com>

_url=https://github.com/aarnt/octopi

pkgbase=octopi
pkgname=(octopi octopi-notifier-frameworks)
pkgver=0.15.0
pkgrel=5
pkgdesc='This is Octopi, a powerful Pacman frontend using Qt libs'
arch=('x86_64')
license=('GPL-2.0-or-later')
url="https://tintaescura.com/projects/octopi/"
makedepends=(qt5-tools cmake knotifications5 sudo alpm-octopi-utils pacman)
depends=(
    glibc
    gcc-libs
    qt5-base
    qtermwidget
)
source=("$pkgbase-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e94525d906d6ab4f5fc594cf1a267668ae5f1fa7f32e449ddfa84328dd738f30')

prepare() {
    cd "$pkgbase-$pkgver"
    cp resources/images/octopi_green.png resources/images/octopi.png
}


build() {
    cmake -S "$pkgbase-$pkgver" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr # -DUSE_QTERMWIDGET6=ON
    cmake --build build
}

package_octopi() {
    depends+=(
        pacman libalpm.so
        alpm-octopi-utils libalpm_octopi_utils.so
        sudo
    )
    optdepends=('pacaur: for AUR support'
            'paru: for AUR support'
            'pikaur: for AUR support'
            'trizen: for AUR support'
            'yay: for AUR support'
            'pacmanlogviewer: to view pacman log files'
            'octopi-notifier-frameworks: Notifier for Octopi with Knotifications support')
    provides=('octopi-repoeditor' 'octopi-cachecleaner')

    DESTDIR="$pkgdir" cmake --install build

    install -d _octopi-notifier/{/etc/xdg/autostart,usr/share/applications,usr/bin}
    mv -v "$pkgdir"/etc/xdg/autostart/octopi-notifier.desktop _octopi-notifier/etc/xdg/autostart/
    mv -v "$pkgdir"/usr/share/applications/octopi-notifier.desktop _octopi-notifier/usr/share/applications/
    mv -v "$pkgdir"/usr/bin/octopi-notifier _octopi-notifier/usr/bin/
    rm -rv "$pkgdir"/etc
}

package_octopi-notifier-frameworks() {
    pkgdesc+=' (notifier)'
    depends+=(
        octopi
        pacman libalpm.so
        alpm-octopi-utils libalpm_octopi_utils.so
        knotifications5
    )
    provides=('octopi-notifier')


    mv -v _octopi-notifier/* "$pkgdir"/
}

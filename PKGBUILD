# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: MatMoul <matmoul at the google email domain which is .com>

_url=https://gitea.artixlinux.org/artoo/octopi

pkgbase=octopi
pkgname=(octopi octopi-notifier-frameworks)
pkgver=0.16.0
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
    alpm-octopi-utils
    pacman
    pacman-contrib
    git
)
depends=(
    glibc
    gcc-libs
    qt6-base
#     qt6-5compat
    qtermwidget
)
source=(
    git+https://github.com/aarnt/octopi.git#tag=v$pkgver
    octopi-kf6-notifier-fix.patch::$_url/commit/43b96933163c2699da3150c01a155ee48f35d5d8.patch
    octopi-qt-sudo-path-fix.patch::$_url/commit/f3ff2e68123b3aaf9885116e4543324e6f37fa80.patch
)
sha256sums=('eab0b6cdbc2470ccd91ed589363f231d94879a07a4d1e14d14de5b48edf0f096'
            '9f0ac3c72e93666670fdb767280c43e5f7518e97e5ecb8778ebf4ffb28da9867'
            'd0f8e977faab34f63496993c8401a16cd07a8f189532f397b67993a55035e46d')

prepare() {
    cd "$pkgbase"
    git apply ../octopi-kf6-notifier-fix.patch
    git apply ../octopi-qt-sudo-path-fix.patch
    cp resources/images/octopi_green.png resources/images/octopi.png
}

build() {
    cmake -S "$pkgbase" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package_octopi() {
    depends+=(
        alpm-octopi-utils libalpm_octopi_utils.so
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

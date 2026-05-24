# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: MatMoul <matmoul at the google email domain which is .com>

_url=https://gitea.artixlinux.org/artix/octopi

pkgbase=octopi
pkgname=(octopi octopi-notifier)
pkgver=0.19.0
pkgrel=1
pkgdesc='This is Octopi, a powerful Pacman frontend using Qt libs'
arch=('x86_64')
license=('GPL-2.0-or-later')
url="https://tintaescura.com/projects/octopi/"
makedepends=(
    qt6-tools
    qt6-5compat
    qt6-svg
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
    libgcc
    libstdc++
    qt6-base
    qt6-multimedia
    qtermwidget
)
source=(
    "git+https://github.com/aarnt/octopi.git#tag=v$pkgver"
    "$pkgbase-$pkgver-use-liboctopi.patch::$_url/commit/ffcf28bb34114a70fa310351ac8e0da7a85d02a7.patch"
    "$pkgbase-$pkgver-use-qt-sudo-config.patch::$_url/commit/9a19bc397d57f48f382813ab0a3a7ba5906b736c.patch"
)
sha256sums=('7c56e17fcecd3da460a9c576ddb325194d7f45ab6d61b5b91ba55fb8ff348016'
            'fdb0b45cdd8832610fdb41dfb5406142ef36cf9afd64a2b37670e2600352127f'
            '57fcc21dea45e0b981bc12b11d351b70b9bd6d299ff63a452e23b3299088d606')

prepare() {
    cd "$pkgbase"
    git apply ../"$pkgbase-$pkgver"-use-liboctopi.patch
    git apply ../"$pkgbase-$pkgver"-use-qt-sudo-config.patch

    cp resources/images/octopi-svg-green.svg resources/images/octopi.svg
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

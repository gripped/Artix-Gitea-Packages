# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
# Contributor: Artoo <artoo@artixlinux.org>

_alpm=3.2

pkgbase=dinit
pkgname=('dinit' 'dinit-base')
pkgver=0.22.1
pkgrel=1
pkgdesc="Service monitoring/init system"
arch=('x86_64')
url="https://github.com/davmac314/dinit"
license=('Apache-2.0')
makedepends=(
    'git'
    'libcap'
    'libgcc'
    'libstdc++'
    'glibc'
)
source=("git+$url.git#tag=v${pkgver}"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm"
        "dinit-init")
sha256sums=('62935f47d1aa836bc1001191e7c748d4c949732837e6eef7839ac5ea1c02eceb'
            '8959015f7fc8075dd5ee0abc53e7dd7e4d65b2feb53d5bb9bcd04535166bf371'
            '312e71de8dcf8eb1055b7ed46012bd6f54546c500434426ecf813536be078502')

build() {
    make -C "$pkgname" CXXFLAGS+="-std=c++17"
}

check() {
    make -C "$pkgname" check
}

package_dinit-base() {
    pkgdesc='Service monitoring/init system -- base package'
    depends=(
        'glibc'
        'libcap'
        'libgcc'
        'libstdc++'
    )
    install=dinit.install

    make -C "dinit" DESTDIR="$pkgdir/" SBINDIR=/usr/bin BUILD_SHUTDOWN=no install
}

package_dinit() {
    pkgdesc='Service monitoring/init system -- init package'
    depends=(
        'dinit-base'
        'dinit-rc'
        'libgcc'
        'libstdc++'
        'glibc'
        'sh'
    )
    provides=(
        'svc-manager'
    )
    conflicts=(
        'svc-manager'
    )

    make -C "$pkgname" DESTDIR="$pkgdir/" SBINDIR=/usr/bin BUILD_SHUTDOWN=yes install

    # remove dinit-base pkgs
    rm -f "$pkgdir/usr/bin/"{dinit,dinit-check,dinitctl,dinit-monitor}
    rm -rf "$pkgdir/usr/share/man/man5"
    rm -f "$pkgdir/usr/share/man/man8/"{dinit,dinit-check,dinitctl,dinit-monitor}.8

    # alpm hooks
    make -C alpm-hooks  DESTDIR="$pkgdir/" install_dinit

    # dinit-init symlink
    install -Dm755 "$srcdir"/dinit-init "$pkgdir"/usr/bin/dinit-init
}

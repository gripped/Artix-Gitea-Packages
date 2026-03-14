# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
# Contributor: Artoo <artoo@artixlinux.org>

_alpm=2.4.2

pkgbase=dinit
pkgname=('dinit' 'dinit-base')
pkgver=0.21.0
pkgrel=1
pkgdesc="Service monitoring/init system"
arch=('x86_64')
url="https://github.com/davmac314/dinit"
license=('Apache-2.0')
makedepends=(
    'git'
    'gcc-libs'
    'glibc'
)
depends=('libcap')
source=("git+$url.git#tag=v${pkgver}"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm"
        "dinit-init")
sha256sums=('5fdcc804d70e82223bd85ebb9f5e86dc0f95793132256e027da41f71e4b3c623'
            '3fcb8e642f8219ec9ce774032a746c07722bb48cd8e5f989806ad73d9eefb505'
            'e65c299e04c9184dc1f68388670dacc89a4df2445d3f41a640b18dae24eaf03b')

build() {
    make -C "$pkgname"
}

package_dinit-base() {
    pkgdesc='Service monitoring/init system -- base package'
    depends=(
        'glibc'
        'gcc-libs'
    )
    install=dinit.install

    make -C "dinit" DESTDIR="$pkgdir/" SBINDIR=/usr/bin BUILD_SHUTDOWN=no install
}

package_dinit() {
    pkgdesc='Service monitoring/init system -- init package'
    depends=(
        'dinit-base'
        'dinit-rc'
        'gcc-libs'
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

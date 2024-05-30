# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>
# NOTE: Explicitly unsupported.
pkgbase=turnstile
pkgname=('turnstile' 'turnstile-dinit')
pkgver=0.1.8
pkgrel=7
pkgdesc="Work-in-progress session/login tracker as a logind alternative"
arch=("x86_64")
url="https://github.com/chimera-linux/turnstile"
license=('BSD')
depends=("pam" "dinit-base")
groups=('turnstile-experimental')
makedepends=("meson" "scdoc")
install="turnstile.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        dummy-ready.patch rundir_late.patch runit-backend.patch)
sha256sums=('7eaab8c80c76ae9a9a711d7dc57ec346b9af09be99b526a5a3129a7fc9bd7a76'
            '2e5d1b22374463047652b916f25ae952806f0ece98e46744433ec59fe90a94f4'
            '20421682e5a15944ded40129cd9d9b586b3b00da4f90c1eb901ee6ab74cc2afa'
            '00b84ea254e6a9d10766efd30905fc94f980431ce614de354c6fceb8485f8db6')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i -e "s/init-local/local/" data/dinit/turnstiled
    patch -p1 < ../dummy-ready.patch
    patch -p1 < ../rundir_late.patch
    patch -p1 < ../runit-backend.patch
}

build() {
    local meson_options=(
        -D runit=enabled
    )
    artix-meson "$pkgname-$pkgver" build "${meson_options[@]}"
    meson compile -C build
}

package_turnstile() {
    meson install -C build --destdir "$pkgdir"

    # remove dinit service as it's handled by turnstile-dinit service
    rm -rf "$pkgdir/etc/dinit.d"
}

package_turnstile-dinit() {
    pkgdesc="dinit service scripts for turnstile"
    depends=('turnstile' 'dinit')
    provides=('init-turnstile')
    conficts=('init-turnstile')
    install -Dm644 "$pkgbase-$pkgver/data/dinit/turnstiled" "$pkgdir/etc/dinit.d/turnstiled"
}

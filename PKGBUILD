# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>
pkgbase=turnstile
pkgname=('turnstile' 'turnstile-dinit')
pkgver=0.1.10
pkgrel=2
pkgdesc="Work-in-progress session/login tracker as a logind alternative"
arch=("x86_64")
url="https://github.com/chimera-linux/turnstile"
license=('BSD')
depends=("pam" "dinit-base")
groups=('turnstile-experimental')
makedepends=("meson" "scdoc")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('186adf1402f3c63eecdbed241145cb029b7b1268c701a87381522d5b64583f2d')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i -e "s/init-local/local/" -e "s|log/|log/dinit/|" data/dinit/turnstiled
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
    provides=('init-turnstile' 'dinit-user-services')
    conficts=('init-turnstile' 'dinit-user-services' 'dinit-user-spawn')
    install -Dm644 "$pkgbase-$pkgver/data/dinit/turnstiled" "$pkgdir/etc/dinit.d/turnstiled"
}

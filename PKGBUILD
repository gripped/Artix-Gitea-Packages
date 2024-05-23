# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>
# NOTE: Explicitly unsupported.
pkgbase=turnstile
pkgname=('turnstile' 'turnstile-dinit')
pkgver=0.1.8
pkgrel=6
pkgdesc="Work-in-progress session/login tracker as a logind alternative"
arch=("x86_64")
url="https://github.com/chimera-linux/turnstile"
license=('BSD')
depends=("pam" "dinit-base")
groups=('turnstile-experimental')
makedepends=("meson" "scdoc")
install="turnstile.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7eaab8c80c76ae9a9a711d7dc57ec346b9af09be99b526a5a3129a7fc9bd7a76')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i -e "s/init-local/local/" data/dinit/turnstiled
}

build() {
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
    install -Dm644 "$pkgbase-$pkgver/data/dinit/turnstiled" "$pkgdir/etc/dinit.d/turnstiled"
}

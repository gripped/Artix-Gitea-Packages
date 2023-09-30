# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>
# NOTE: Explicitly unsupported.
pkgname=turnstile
pkgver=0.1.8
pkgrel=2
pkgdesc="Work-in-progress session/login tracker as a logind alternative"
arch=("x86_64")
url="https://github.com/chimera-linux/turnstile"
license=('BSD')
depends=("pam")
groups=('turnstile-experimental')
makedepends=("meson" "scdoc")
install="turnstile.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7eaab8c80c76ae9a9a711d7dc57ec346b9af09be99b526a5a3129a7fc9bd7a76')

prepare() {
    # If https://github.com/davmac314/dinit/issues/245 is done,
    # I think we can do away with this.
    cd "$pkgname-$pkgver"
    sed -i  -e "s/login.target/loginready/" \
            -e "s/init-local.target/rclocal/" data/dinit/turnstiled
}

build() {
    artix-meson "$pkgname-$pkgver" build "${meson_options[@]}"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}

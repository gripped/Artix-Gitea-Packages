# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=libnfs
pkgver=7.0.2
pkgrel=1
pkgdesc="client library for accessing NFS shares"
arch=('x86_64')
url="https://github.com/sahlberg/libnfs"
license=('GPL')
options=('debug')
depends=('gnutls' 'krb5')
makedepends=('cmake' 'ninja')
source=(
    "https://github.com/sahlberg/$pkgname/archive/$pkgname-$pkgver.tar.gz"
)
sha512sums=('b1f34d95119a5e8aeef55b9a8fe4b1d394f94bf66da8c66a24a99fb457316ef124574a8ebda340e0be6f29809ed4f4824eef0b064f67af46e90e2307085979c5')

#prepare() {
    #cd "$pkgname-$pkgname-$pkgver"
#}

build() {
    cd "$pkgname-$pkgname-$pkgver"

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_DOCUMENTATION=ON \
        -DENABLE_UTILS=ON \
        -DENABLE_MULTITHREADING=ON \
        -B build \
        -G Ninja
    ninja -v -C build $MAKEFLAGS
}

package() {
    cd "$pkgname-$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -v -C build install
}


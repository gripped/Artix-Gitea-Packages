# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: hexchian <i at hexchain dot org>

pkgname=crun
pkgver=1.26
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers"
url="https://github.com/containers/crun"
license=('LGPL-2.1-or-later')
arch=('x86_64')
provides=('oci-runtime')
depends=('yajl' 'libudev' 'libcap' 'libseccomp' 'criu' 'libkrun')
makedepends=('libtool' 'python' 'go-md2man' 'udev' 'git')
source=("git+https://github.com/containers/crun.git#tag=$pkgver?signed")
validpgpkeys=('AC404C1C0BF735C63FF4D562263D6DF2E163E1EA')
sha256sums=('c42d4baf9a8f2e337b3b54f8659357fcd2697ef36f32bf6d41e8d0c91613632c')

build() {
    cd "$pkgname"
    ./autogen.sh
    ./configure --disable-systemd \
        --prefix=/usr \
        --enable-shared \
        --enable-dynamic \
        --with-python-bindings \
        --with-libkrun
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}

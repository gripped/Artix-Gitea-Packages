# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Otreblan <otreblain@gmail.com>

pkgname=draco
pkgver=1.5.8
pkgrel=1
pkgdesc="A library for compressing and decompressing 3D geometric meshes and point clouds"
arch=('x86_64')
url="https://github.com/google/draco"
license=('Apache-2.0')
makedepends=('cmake' 'ninja')
depends=('glibc' 'libgcc' 'libstdc++')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d42d730526c8dd0ed2ac0b3edc6495bda4bc78298031ad5cb4dc94a8bdd93f94')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    CXXFLAGS+=' -ffat-lto-objects'
    cmake \
        -Bbuild \
        -GNinja \
        -DCMAKE_UNITY_BUILD=ON \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON

    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    DESTDIR="$pkgdir" ninja -C build install
}

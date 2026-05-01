# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Martchus <martchus@gmx.net>

pkgname=libfilezilla
epoch=1
pkgver=0.55.4
pkgrel=4
pkgdesc="Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs"
url="https://lib.filezilla-project.org/"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('glibc' 'gmp' 'nettle' 'gnutls' 'libgcc' 'libstdc++' 'libnettle.so' 'libhogweed.so' 'libcrypt.so')
makedepends=('clang')
checkdepends=('cppunit')
provides=('libfilezilla.so')
# Upstream download link became (purposely) unstable
# See https://trac.filezilla-project.org/ticket/13186
#source=("https://download.filezilla-project.org/libfilezilla/libfilezilla-${pkgver}.tar.xz")
source=("https://sources.archlinux.org/other/libfilezilla/${pkgname}-${pkgver}.tar.xz"
         nettle-4.patch)
sha512sums=('ed6fd7e18e65a422360eb017495aadabc37912e2c982978296195e134807d2a5043adb6f81b52b36cc3d7b0f8d1cadc99c2aad9c692dc96f4ad1872d5b16b055'
            '2ad113047d1b97a78983dd6ed5774ad09f67b025dab2b07d7ed6783c9511a1c4a53d3f62202efdd6c3a27cdf1e3f06d1b3a28314a8b97000843bba54cd8cd25c')
b2sums=('7ec7dfe94105b3bdc48c8a8a3486cf68764cf80c3fc39a8be39aef745471bdcb0c55a6f6146ffe6067318329d92042102daf645edf48f58b3d4c975160b15013'
        '0f92b21f819c418c38c80eced4e7e4611859d146e91f249e9af4299ae7581db22ecd9b143228f84254ea525936fcf26f32260d60c077087c73e5d369b69b554f')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../nettle-4.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  export CXX=clang++
  export CC=clang
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  # LANG needed to fix string_test::test_conversion2
  LANG=en_US.UTF-8 make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:

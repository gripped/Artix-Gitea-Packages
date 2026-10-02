# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Grey Christoforo

pkgname=python-pivy
pkgver=0.6.11
pkgrel=2.1
epoch=1
pkgdesc='Python bindings to Coin3D'
arch=(x86_64)
url='https://github.com/coin3d/pivy'
license=(ISC)
depends=(
  glibc
  libgcc
  libstdc++
  coin
  python
  pyside6
  python-numpy
  qt6-base
  soqt
)
makedepends=(
  git
  cmake
  glu
  swig
)
source=("$pkgname::git+$url#tag=$pkgver"
	"pivy-swig-4.5-compat.patch")
sha512sums=('870157cb85fbac12ba9a2563ca37527047869662e6f3673e63ae653139886991c90cf4181d815713978d67202a33930a1d867076f6289563551c813e5ee3068e'
            '15fce70fef2f5a00e1940ca7554ddf399de46f2636b1c59344b69b55ae4d340645b051b19bfd926af30eae8f6a034dd9b93475c2e59e3655d3b088a1dc31ac70')
b2sums=('e6de880fd52a9ba6795bd3949b8fc89baf4391ba0317e9ec8178121a3eb562c4126ed9eea8a159d351141b332cb17b745c0b0f3092564e6c27f9294de88b61f0'
        '362c03165a099294f87a5b360f0148c5a0339e687a6e2107e8e95707d90e3cdb57e7ee1ea2b3236269c2fb6d110d6f89faf8c4459a4fcd65602948ffb4fd7b16')

build() {
  cd "$pkgname"

  # python2 api support dropped
  patch -Np1 < "$srcdir/pivy-swig-4.5-compat.patch"

  # NOTE: out-of-tree build broken: https://github.com/coin3d/pivy/issues/72
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D PIVY_USE_QT6=ON
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir" cmake --install build

  # compile Python bytecode as cmake does not do that for us
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

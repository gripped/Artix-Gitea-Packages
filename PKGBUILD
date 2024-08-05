# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase='protobuf'
pkgname=('protobuf' 'python-protobuf')
pkgver=27.3
pkgrel=1
# Note: libphonenumber needs a rebuild for every version bump ??
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=(
  'gcc-libs'
  'glibc'
  'zlib'
  'abseil-cpp'
)
makedepends=(
  'bazel'
  'cmake'
  'gtest'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  python-pytest
  python-numpy
)
source=(https://github.com/protocolbuffers/protobuf/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/protocolbuffers/protobuf/commit/2e62ef1e.patch)
sha512sums=('a3a555f17a069dd4aa0d683d3126915077fe4211ae6532a4947fb76a9eeb1ed7d25d29ada8dc372435a08aad1aa14374d88e92ac7c195510f57609efaf9d341d'
            '18bc71031bbcbc3810a9985fa670465040f06a6c104ab8079b56bdfc499bb6cec40805a0cefd455031142490a576dc60aa8000523877ac0353b93558e9beabbd')

prepare() {
  patch -d $pkgname-$pkgver -p1 < 2e62ef1e.patch # Fix cmake config compatibility mode
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" 
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    -D protobuf_BUILD_SHARED_LIBS=ON
    -D protobuf_USE_EXTERNAL_GTEST=ON
    -D protobuf_ABSL_PROVIDER=package
    -S "$pkgbase-$pkgver"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose

  cd "$pkgbase-$pkgver"
  bazel build //python/dist:binary_wheel
}

check() {
  ctest --test-dir build
}

package_protobuf() {
  replaces=('protobuf-cpp')
  provides=('libprotoc.so' 'libprotobuf.so' 'libprotobuf-lite.so')

  DESTDIR="$pkgdir" cmake --install build

  cd $pkgbase-$pkgver
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 editors/protobuf-mode.el \
    -t "$pkgdir/usr/share/emacs/site-lisp/"
  install -vDm 644 editors/proto.vim \
    -t "${pkgdir}/usr/share/vim/vimfiles/syntax"
}

package_python-protobuf() {
  pkgdesc='Python 3 bindings for Google Protocol Buffers'
  depends=(
    "protobuf=$pkgver"
    'python'
  )

  python -m installer --destdir="$pkgdir" "$pkgbase-$pkgver"/bazel-bin/python/dist/*.whl
  install -vDm 644 $pkgbase-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

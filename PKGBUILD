# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=maturin
pkgname=(
  maturin
  python-maturin
)
pkgver=1.11.0
pkgrel=1
pkgdesc="Build and publish crates with pyo3, rust-cpython and cffi bindings"
url="https://github.com/PyO3/maturin"
arch=(x86_64)
license=('Apache-2.0 OR MIT')
makedepends=(
  bzip2
  gcc-libs
  git
  glibc
  python-build
  python-installer
  python-setuptools
  python-setuptools-rust
  python-wheel
  rust
  xz
)
checkdepends=(
  python-cffi
  python-pycparser
  python-virtualenv
)
# Disable LTO until ring can be built with it:
# https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=("git+$url.git#tag=v$pkgver")
sha512sums=('be353907c1c470dfd565b753311c0b5ebee3ecd55ebe23c53fab6a778c9e8b58912332a81adb2cea49af07ad3f63f31b4f8d1b39038df1984688a477c8679ba8')
b2sums=('1d2e839582f47d7327bb519ec2052fadaa0e243ea9b1166a4d3d1d137a598eabd9c20f5c5131c32b54b24301216df8c87af3bbd543f819a8e490d16f309d99b8')

prepare() {
  cd $pkgbase
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgbase
  MATURIN_SETUP_ARGS="--frozen" python -m build --wheel --no-isolation
}

check() {
  cd $pkgbase
  mkdir -p test-crates/venvs
  local cargo_skip_args=(
    # Requires wasm32-wasip1 target
    --skip=integration_wasm_hello_world
  )
  # Using --all-features here causes test failures due to:
  #   Cause: unsupported Zip archive: Unsupported compression level
  cargo test --frozen -- "${cargo_skip_args[@]}"
}

package_maturin() {
  depends=(
    bzip2
    gcc-libs
    glibc
    openssl
    rust
    xz
  )

  cd $pkgbase
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vr "$pkgdir/usr/lib"
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" {Changelog,README}.md
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" license-mit
}

package_python-maturin() {
  pkgdesc+=" - Python bindings"
  groups=(python-build-backend)
  depends=(
    "maturin=$pkgver"
    python
  )

  cd $pkgbase
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vr "$pkgdir/usr/bin"
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" license-mit
}

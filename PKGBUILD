# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=maturin
pkgname=(
  maturin
  python-maturin
)
pkgver=1.14.0
pkgrel=1
pkgdesc="Build and publish crates with pyo3, rust-cpython and cffi bindings"
url="https://github.com/PyO3/maturin"
arch=(x86_64)
license=('Apache-2.0 OR MIT')
makedepends=(
  git
  glibc
  libgcc
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
sha512sums=('81ce8303bd813c78d1c343d19a6a4b5b57665d3bf8d1b70325981d8e4a6792765574da7fc55e04334c26b1e072699e13bd8f97eb491dcf421c0ffd4498f816be')
b2sums=('9c6559f011750243e60e6ff95b1d34f02b505670c9a2fe04dacfcff5c85f89ee02dca2c7f008d6e5e5214f5c313f9ba4b3d54045703fabb6d28997f98b3731e0')

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
    libgcc
    glibc
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

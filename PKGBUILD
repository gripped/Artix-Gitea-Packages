# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=maturin
pkgname=(
  maturin
  python-maturin
)
pkgver=1.8.0
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
)
# disable LTO until ring can be built with it: https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('35756bb850204d4d2451d6a88e56d9519a359b00c3984c43bdde5013e2c4bd2598ed8fea234ecd99e84f4f5dcaf042d6783f11541403e6c41de15cd30930e3ab')
b2sums=('2dd6adfc33c2a0f4b4ad1dd06844a56e88886e871b9715ae0bb6cc593632ce036fd3f8accf3a1abb5abdc37fd88583b34a6504ed031c18b698021179f42a95bd')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#"$pkgdir/"}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  cd $pkgbase-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgbase-$pkgver
  MATURIN_SETUP_ARGS="--all-features" python -m build --wheel --no-isolation
}

package_maturin() {
  depends=(
    bzip2
    gcc-libs
    glibc
    openssl
    rust
  )

  cd $pkgbase-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {Changelog,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 license-mit -t "$pkgdir/usr/share/licenses/$pkgname/"

  (
    cd "$pkgdir"
    _pick python-$pkgbase usr/lib
  )
}

package_python-maturin() {
  pkgdesc+=" - Python bindings"
  groups=(python-build-backend)
  depends=(
    maturin=$pkgver
    python
  )

  mv -v $pkgname/* "$pkgdir"

  install -vDm 644 $pkgbase-$pkgver/license-mit -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-rpds-py
pkgver=2026.6.2
pkgrel=1
pkgdesc='Python bindings to the Rust rpds crate for persistent data structures'
arch=(x86_64)
url='https://github.com/crate-py/rpds'
license=(MIT)
depends=(
  glibc
  libgcc
  python
)
makedepends=(
  git
  python-build
  python-maturin
  python-installer
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('739f027abfc7ae3a3edb2271dbb1275e83b02f66a48577353d001922a65f7d3dcd7b5c20e3b1bffa33db8ddc9f2d13f68bc66826a13f8e625c299d2c712b0ae6')
b2sums=('47c363450235ab8ec49bee38351fc6bbc763062d95c0ffb527c6fe1079291cc6877558ec9349b3ce63d2d5519080eec0d2e5834203cdc677b4250e3b60e24b25')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: William J Bowman <bluephoenix47@gmail.com>

pkgname=python-certifi
pkgver=2026.10.18
pkgrel=1
pkgdesc="Python package for providing Mozilla's CA Bundle (using system CA store)"
arch=(any)
url="https://github.com/certifi/python-certifi"
license=(MPL-2.0)
depends=(
  ca-certificates
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("git+$url.git#tag=$pkgver")
sha512sums=('e789305f3436153c65bfd53c4b3b6f3eca1febe225cae6f3d362da572862c9a05266e89b79cd2a5e90ae774f3f8167b23955b817cfe2ddbe39178022d2d63242')
b2sums=('a361a3eb71e25b00ba53cf0933d0cbb73d3d975cdd11ac17c8cce3a415a6465b7ef543fc243e3e380f02c426be33e94f4c363c96082da10f86b95845840c5fe3')

prepare() {
  cd $pkgname
  # Use system CA store. Replacing the copy in the source tree so the test
  # suite is actually run against it.
  ln -sf /etc/ssl/certs/ca-certificates.crt certifi/cacert.pem
  # Our CA store has non-ASCII comments, but we are not packaging for JVM
  # https://github.com/certifi/python-certifi/issues/50
  sed -i 's/encoding="ascii"/encoding="utf-8"/' certifi/core.py
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Replace CA store here again because the symlink was installed as a file
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir/$site_packages/certifi/cacert.pem"

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testresources
pkgver=2.1.1
pkgrel=1
pkgdesc="Testresources, a pyunit extension for managing expensive test resources"
arch=('any')
license=('Apache-2.0' 'BSD-3-Clause')
url="https://launchpad.net/testresources"
depends=('python')
makedepends=('git' 'python-build' 'python-hatch-vcs' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-fixtures' 'python-testtools')
source=("git+https://github.com/testing-cabal/testresources.git#tag=$pkgver")
sha512sums=('821e7f9b991a4b9a52ba7552fb86deb4cf257ec2faf68fe773326b049e866f7d83af0faf2426782aa6102eaef073ea8e83998c976316d5e8bd19d4f8edde965b')

build() {
  cd testresources
  python -m build --wheel --no-isolation
}

check() {
  cd testresources
  python -m testtools.run tests.test_suite
}

package() {
  cd testresources
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}

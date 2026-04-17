# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testscenarios
pkgver=0.6
pkgrel=1
pkgdesc="Testscenarios, a pyunit extension for dependency injection"
arch=('any')
license=('Apache-2.0' 'BSD-3-Clause')
url="https://github.com/testing-cabal/testscenarios"
depends=('python-testtools')
makedepends=('git' 'python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer' 'python-wheel')
source=("git+https://github.com/testing-cabal/testscenarios.git#tag=${pkgver}")
sha512sums=('9637e11926966f2f162e0cae49ff31015c5c46c10bb6a35794acd64727b8d8ebbaf826fe4a558ee1495cf4a33ccc260d7817a86fe2491c0949383b95a0979282')

build() {
  cd testscenarios
  python -m build --wheel --no-isolation
}

check() {
  cd testscenarios
  python -m testtools.run testscenarios.test_suite
}

package() {
  cd testscenarios
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 BSD -t "$pkgdir"/usr/share/licenses/$pkgname/
}

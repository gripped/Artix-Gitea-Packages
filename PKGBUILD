# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testresources
pkgver=2.1.0
pkgrel=1
pkgdesc="Testresources, a pyunit extension for managing expensive test resources"
arch=('any')
license=('Apache-2.0' 'BSD-3-Clause')
url="https://launchpad.net/testresources"
depends=('python')
makedepends=('git' 'python-build' 'python-hatch-vcs' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-fixtures' 'python-testtools')
source=("git+https://github.com/testing-cabal/testresources.git#tag=$pkgver")
sha512sums=('3c075414781f7d81e754fbeaefcf717c1b52b106d00e305371b0a9b8ca9fa026208420dae12ce64d8b275ded3a8fa5b0ded656c5298ef95d9d7a689ed2c09b9f')

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

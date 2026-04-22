# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.12
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("git+https://github.com/kjd/idna.git#tag=v$pkgver")
sha512sums=('c8eaf05ff4d6ed9e93805023b74165b4e3821992be48afc7ac35b2e2fae0c834d3ded62fe44e5e23ac4da9f4d883c135fc2d1f0a48de2394ad8106083571c8cc')

build() {
   cd idna
   python -m build --no-isolation --wheel
}

check() {
   cd idna
   pytest
}

package() {
   cd idna
   python -m installer --destdir="$pkgdir" dist/*.whl
   install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}

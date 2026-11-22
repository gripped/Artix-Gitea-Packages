# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ijson
pkgver=3.6.0
pkgrel=1
pkgdesc="Iterative JSON parser with Pythonic interface"
arch=(x86_64)
url="https://github.com/ICRAR/ijson"
license=('BSD-3-Clause' 'ISC')
depends=('python' 'yajl')
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ICRAR/ijson/archive/v${pkgver}.tar.gz")
sha256sums=('e808a021d501d1d400006eedb7b77a5511bc6b1cf390a58c254a076aa0d85076')

build() {
  cd ijson-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ijson-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest
}

package(){
  cd ijson-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}

# vim:ts=2:sw=2:et:

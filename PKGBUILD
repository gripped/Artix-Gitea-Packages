# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-marshmallow
pkgver=3.24.2
pkgrel=1
pkgdesc="A lightweight library for converting complex datatypes to and from native Python datatypes."
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
arch=('any')
depends=('python-packaging')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-simplejson')
source=("git+https://github.com/marshmallow-code/marshmallow.git#tag=$pkgver")
sha512sums=('7bd2230b1e43772cc8f1066c8928bc3d951a729bc1c290a53227e9fc692b3bbbac21dbd85f83b00348ebbff287e10b3f7f8dcba3732e3b9a4d3046ae8d630591')

build() {
  cd marshmallow
  python -m build --wheel --no-isolation
}

check() {
  cd marshmallow
  python -m venv --system-site-packages .testenv
  .testenv/bin/python -m installer dist/*.whl
  .testenv/bin/python -m pytest
}

package() {
  cd marshmallow
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

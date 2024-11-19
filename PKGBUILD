# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=python-bottleneck
pkgver=1.4.0
pkgrel=2
pkgdesc="Fast NumPy array functions written in Cython"
arch=(x86_64)
url="https://github.com/kwgoodman/bottleneck"
license=(BSD-2-Clause)
depends=(python-numpy)
makedepends=(python-setuptools python-build python-installer python-wheel python-versioneer)
checkdepends=(python-pytest)
#source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz) # https://bugs.archlinux.org/task/77683
sha256sums=('104c6548f9cb266a6bb0345e7f254383833c273fc3f14c2aaacf48a1c4ba4743')

prepare() {
  cd bottleneck-${pkgver}
  # Drop build requirement on oldest-supported-numpy
  sed -i '/oldest-supported-numpy/d' pyproject.toml
}

build() {
  cd bottleneck-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd bottleneck-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python setup.py install --skip-build
  test-env/bin/python /usr/bin/pytest -vv --color=yes --pyargs bottleneck
}

package() {
  cd bottleneck-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

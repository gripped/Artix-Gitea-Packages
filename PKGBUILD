# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=python-dulwich
_name=${pkgname#python-}
pkgver=0.21.6
pkgrel=2
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=('x86_64')
url=https://www.dulwich.io
license=('GPL')
depends=('python-urllib3')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-gpgme' 'python-paramiko')
optdepends=(
  'python-fastimport: for fast-import support'
  'python-gpgme: for PGP signature support'
  'python-idna: for HTTPS support via urllib3'
  'python-paramiko: for use as the SSH implementation'
  'python-pyopenssl: for HTTPS support via urllib3'
  'python-pyinotify: to watch for changes to refs'
)
source=("https://github.com/jelmer/dulwich/archive/refs/tags/dulwich-$pkgver.tar.gz")
b2sums=('71834272a4c545a3cd254639dc9a59a81644764ee24ea5bb9a644ee67f94737745697ec3ddd889dc99327afd5cf11453ef06d99dc8750aa9f6f0e2c93e6e59a7')

build() {
  cd "dulwich-dulwich-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "dulwich-dulwich-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest dulwich.tests.test_suite
}

package() {
  cd "dulwich-dulwich-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

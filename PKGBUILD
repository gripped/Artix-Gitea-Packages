# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=python-frozenlist
pkgver=1.6.2
pkgrel=1
pkgdesc='FrozenList is a list-like structure which can be made immutable'
arch=('x86_64')
url='https://github.com/aio-libs/frozenlist'
license=('Apache-2.0')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'cython'
  'python-build'
  'python-expandvars'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('98af12defa65033f42a1ead3012dc6a2df5b018fc96fb02449aeb42465bd22c86edb28663d35c5a2bdbcda71649c99e8edae98836de6ace6957599474a00dda7')
b2sums=('88daf2ba5476902fbd1c49a547bfa1d2b6aca4892f3476c275bb7cfddd04c186a7db2dd85d810ef4f8a9ba097ea79a10f9b3604a575b693b3a011e50a17cf101')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --override-ini="addopts="
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" CHANGES.rst README.rst
}

# vim: ts=2 sw=2 et:

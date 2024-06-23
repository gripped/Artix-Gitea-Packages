# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=python-pymongo
_pkgname=mongo-python-driver
pkgver=4.7.3
pkgrel=1
pkgdesc="The official MongoDB Python driver"
arch=(x86_64)
license=(Apache-2.0)
url="https://github.com/mongodb/mongo-python-driver"
depends=(
  glibc
  python
  python-dnspython
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pykerberos
  python-pyopenssl
  python-pytest
  python-requests
  python-service-identity
  python-snappy
  python-zstandard
)
optdepends=(
  # Not packaged.
  # 'python-pymongo-auth-aws: for [aws] and [encryption]'
  # 'python-pymongocrypt: for [encryption]'
  'python-cryptography: for [ocsp]'
  'python-pyopenssl: for [ocsp]'
  'python-requests: for [ocsp]'
  'python-service-identity: for [ocsp]'
  'python-pykerberos: for [gssapi]'
  'python-snappy: for [snappy]'
  'python-zstandard: for [zstd]'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver/$pkgver.tar.gz")
sha256sums=('79c674a06ec5d7da014189400b95baec0ce9aca9fc6e9937386b62fb6367bd07')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  pytest
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

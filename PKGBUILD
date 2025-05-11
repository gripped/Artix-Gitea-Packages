# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=python-pymongo
_pkgname=mongo-python-driver
pkgver=4.12.1
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
  python-hatch-requirements-txt
  python-hatchling
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pykerberos
  python-pyopenssl
  python-pytest
  python-pytest-asyncio
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
sha256sums=('1b1d623e8d6d02728f439e381833c9edfb9e306b75d78ac1aa1637c074911420')

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

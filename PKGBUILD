# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-pyftpdlib
_pkgname=${pkgname#python-}
pkgver=1.5.9
pkgrel=3
pkgdesc="Extremely fast and scalable Python FTP server library"
arch=(any)
url="https://github.com/giampaolo/pyftpdlib"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-psutil
  python-pyopenssl
  python-pytest
)
optdepends=(
  'python-pyopenssl: FTPS support'
  'python-psutil: to keep track of FTP server memory usage'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/release-$pkgver/release-$pkgver.tar.gz"
  "regenerate-SSL-certificates-which-was-too-old-and-broke.patch"
)
sha256sums=(
  '7403b762ea16e4c1e5805b81084c09cd099ba6a8f7dbbcaf3e331a889ea883fe'
  'ba13f0e88086fce79662ceb76d05cf04709179978d74d34755b7ee9b2992a432'
)

_archive="$_pkgname-release-$pkgver"

prepare() {
  cd "$_archive"

  patch -Np1 -i "$srcdir/regenerate-SSL-certificates-which-was-too-old-and-broke.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

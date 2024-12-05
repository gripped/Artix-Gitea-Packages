# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=python-levenshtein
_name=Levenshtein
pkgver=0.25.0
pkgrel=3
pkgdesc='Python extension for computing string edit distances and similarities'
arch=('x86_64')
url='https://github.com/rapidfuzz/Levenshtein'
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'python'
  'python-rapidfuzz'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-scikit-build'
  'cython'
  'rapidfuzz-cpp'
)
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'fix_backend.patch')
b2sums=('cb3bb55b37b5bfa8dc95d78dc6898154b4d4240c27348c6e03b13cdaa2c8ff19d1e8f2bf3d6b4fcc5c77be917afaa391276e93dcac24c2c19e1b285653a45c72'
        'e166301b612375d60087af4d0e8e3cb80d8b5a43f1164d67951f30fb19224be7373a4547d059f6445f5c00723fd3fe8e3a60bb7a44103dc5bb6c86984eb3561e')

prepare() {

  # fix backend_patch
  cd "$_name"-"$pkgver"/_custom_build
  patch backend.py < ../../fix_backend.patch
}

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  PYTHONPATH=`echo "$(pwd)"/_skbuild/linux-${CARCH}-*/setuptools/lib.linux-${CARCH}-*` \
  pytest -v
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

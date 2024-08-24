# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
_pkgname=zope.interface
pkgver=7.0.1
pkgrel=1
pkgdesc='Zope Interfaces for Python 3.x'
arch=('x86_64')
url="https://github.com/zopefoundation/zope.interface"
license=('ZPL-2.1')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-event'
  'python-zope-testing'
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c3bc3d4057742f44ba73c16b0440ad33dd9a84c961bfbd057e5a90b14cfce96307da81900749c4615c7ad27ce9467838c2afe3bf2df826e1393c8cf8fdb42d7c')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  zope-testrunner --test-path=src -vc
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

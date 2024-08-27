# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
_pkgname=zope.interface
pkgver=7.0.2
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
sha512sums=('e2fe472cc6a4cc2bdf5b12dda0bb73b2dc4ee239b49d1154c3b4e0a2494d5aba12d3b6d262f3c2de1f1761e2661f368514db3e8f99f16be06527c8f4021d7816')

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

# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Étienne Deparis <etienne [at] depar.is>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Patrick Burroughs <celticmadman at gmail dot com>

pkgname=python-tzlocal
_name=${pkgname#python-}
pkgver=5.4
pkgrel=1
epoch=1
pkgdesc="Tzinfo object for the local timezone"
arch=('any')
url=https://github.com/regebro/tzlocal
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-mock'
)
source=("git+$url.git#tag=$pkgver")
b2sums=('39a2e16868fc48ea5a72deb4e83da7f445f85005bd788f8a7dba12f3c01c287624fe91a8cfa2f78c62db99aff28d69e0263258d6fe4f57794a13edc9dcc4a751')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # docs
  install -vDm 644 {CHANGES.txt,README.rst} \
    -t "$pkgdir/usr/share/doc/$_name"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  # remove unneeded test files: https://github.com/regebro/tzlocal/issues/146
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -frv "$pkgdir/$site_packages/$_name/tests/"
}

# vim:set ts=2 sw=2 et:

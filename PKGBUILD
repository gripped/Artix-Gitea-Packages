# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Étienne Deparis <etienne [at] depar.is>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Patrick Burroughs <celticmadman at gmail dot com>

pkgname=python-tzlocal
_name=${pkgname#python-}
pkgver=5.4.3
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
b2sums=('5c87568ebe3f9becdeddcf89d9371e8f36d452ee756c166ab64e9837f17e6f564f458a262757140e4961604e3628bda98dfdf662595f8c14be24eee6464b035a')

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
}

# vim:set ts=2 sw=2 et:

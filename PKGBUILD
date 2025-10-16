# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

pkgname=python-sphinx-hawkmoth
pkgver=0.21.0
pkgrel=2
pkgdesc="Sphinx autodoc C extension"
url="https://github.com/jnikula/hawkmoth"
arch=(x86_64)
license=(BSD-2-Clause)
depends=(
  clang
  python
  python-docutils
  python-sphinx
)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-xdist
  python-strictyaml
)
source=(
  "git+https://github.com/jnikula/hawkmoth?signed#tag=v$pkgver"
  0001-Fix-parsing-with-cindex.py-from-Clang-21.patch
)
b2sums=('054566db1fd936e9ae1d10449251b356569d492488a39911944ae715bd723aa6e1f6585775743c74364c3f38c68239c3e1c69aac80b86d72861fc47f787c04f3'
        '8cb28156670b253103ec47d9f4467d2fbf16ae09ac94172ca08ab66b79f197b28564130a32cc0fd33a194a0b16066278f0cba668c0ebe957e228c20416a4a888')
validpgpkeys=(
  3FE6F7606966ED87707760B6A14C59DFEDB4CE88 # Jani Nikula <jani@nikula.org>
)

prepare() {
  cd hawkmoth

  # Fix for Clang 21
  git apply -3 ../0001-Fix-parsing-with-cindex.py-from-Clang-21.patch
}

build() {
  python -m build --wheel --no-isolation hawkmoth
}

check() {
  cd hawkmoth
  PYTHONPATH="$PWD/src" make test-verbose
}

package() {
  python -m installer --destdir="$pkgdir" hawkmoth/dist/*.whl
  install -Dm644 hawkmoth/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:

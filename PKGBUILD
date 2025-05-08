# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-aiodns
_name=${pkgname#python-}
pkgver=3.3.0
pkgrel=1
pkgdesc='Simple DNS resolver for asyncio'
arch=(any)
url=https://github.com/saghul/aiodns
license=(MIT)
depends=(python-pycares)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-uvloop
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('4a9b9fcd80daf153d0bde9e153e32de5adfa8479942c8236bc6a9a35b7a353e176d3b3ec55ad87f05c2f5213db2e9901d83c3bedec528b843979b54c43996bd7')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  # Override addopts as they invoke coverage testing
  PYTHONPATH=aiodns:$PYTHONPATH pytest --override-ini="addopts=" -v -k 'not test_gethostbyaddr'
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

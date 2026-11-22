# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python-coverage
pkgver=7.17.4
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://coverage.readthedocs.io/en/latest/"
license=('Apache-2.0')
depends=('glibc' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-pytest' 'python-pytest-xdist' 'python-flaky' 'python-hypothesis')
source=("git+https://github.com/nedbat/coveragepy.git#tag=$pkgver")
sha512sums=('c938f0b6719735cb0ea8146afe36cdaf08cbefe8553d5fccb5ecbf896d5331c86c094dd2acaa84836a8c7fe8105924199a9dcc222a88e7ea98783a8791bc2463')
b2sums=('d0c54ccdfebe3aaf1eee42a76b0fe35dceb1f777d55cf1fdbeba714cd99b03b2a049e87b227800b7c77e9e9c1715a75f92795d9a822e243a4dad13f84ded832b')

prepare() {
  cd $_pkgname
  # Pytest 9.2 requires an integer for assertion verbosity in native TOML config.
  sed -i 's/^verbosity_assertions = "5"$/verbosity_assertions = 5/' pyproject.toml
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python setup.py --quiet build_ext --inplace
  test-env/bin/python tools/igor.py zip_mods
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python tools/igor.py test_with_core ctrace tests/
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

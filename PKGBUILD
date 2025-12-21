# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Leif Warner <abimelech@gmail.com>

pkgname=python-rdflib
pkgver=7.5.0
pkgrel=2
pkgdesc="A Python library for working with RDF, a simple yet powerful language for representing information"
arch=('any')
url="https://github.com/RDFLib/rdflib"
license=('BSD-3-Clause')
depends=('python-pyparsing')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-networkx' 'python-lxml' 'python-orjson')
source=(git+https://github.com/RDFLib/rdflib.git#tag=$pkgver)
sha512sums=('f1ef6dab06dcc9aab465f661e3e552160af970ab255e742718ccad2e1a8e5ee6e7df38f636881e14c95f7b8cd73eb2f2df37652bd204741eaec60615d61f64e4')

build() {
  cd rdflib
  python -m build --wheel --no-isolation
}

check() {
  cd rdflib
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  local pytest_args=(
    -v
    # Requires python-pytest-cov.
    --deselect=test/test_misc/test_plugins.py::test_parser
    --deselect=test/test_misc/test_plugins.py::test_sparqleval
  )
  test-env/bin/python -m pytest "${pytest_args[@]}"
}

package() {
  cd rdflib
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
 

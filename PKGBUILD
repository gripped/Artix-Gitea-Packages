# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=mkdocstrings
pkgver=1.0.7
pkgrel=1
pkgdesc="Automatic documentation from sources, for MkDocs"
arch=(any)
url="https://github.com/mkdocstrings/mkdocstrings"
license=(ISC)
depends=(
  mkdocs
  mkdocs-autorefs
  python
  python-jinja
  python-markdown
  python-markupsafe
  python-pymdown-extensions
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  mkdocs-material
  python-dirty-equals
  python-pygments
  python-pytest
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('92c490ee7e1455bc17445b4a9e3791e92277bafbcb6e8fb729b65ae96fa9f94f8dce918eb884ae7513d8a9a1885549aa2399509084cc65763ffc0ee9de3760ea')

build() {
  cd $pkgname-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselected tests requires handlers, which are not yet packaged.
  # Ignored test test_api.py require python-griffe, also not packaged.
  test-env/bin/python -m pytest \
    --deselect 'tests/test_extension.py' \
    --deselect 'tests/test_handlers.py::test_extended_templates' \
    --deselect 'tests/test_handlers.py::test_nested_autodoc[ext_markdown0]' \
    --deselect 'tests/test_plugin.py::test_disabling_plugin' \
    --ignore tests/test_api.py
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

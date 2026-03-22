# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-rest-framework
_name="${pkgname#python-}"
pkgver=3.17.0
pkgrel=1
pkgdesc="A powerful and flexible toolkit for building Web APIs."
arch=(any)
url="https://www.django-rest-framework.org/"
_url="https://github.com/encode/django-rest-framework"
license=(BSD-3-Clause)
depends=(
  python
  python-django
  python-pytz
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-django
)
optdepends=(
  'python-django-filter: for dynamic queryset filters'
  'python-django-guardian: for a per-object permission model'
  'python-markdown: for markdown support'
  'python-psycopg2: for PostgreSQL support'
  'python-pygments: for syntax highlighting'
  'python-yaml: for YAML support'
)
source=(
  $_name-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz
)
sha512sums=('ed7d438c7facf44bd559b3dd8af8d68ac636721be028a6b84b627a1d99f43c0d1fb50f2849ce5a42efadff47fc76758be7d372fd4190c6e2ffa5af97b8cbb44c')
b2sums=('4f9c5c570d5ead132e438b513d3b62c0a899053612e527ad9a719d642231e88ead306fde1c70f594fb6edf2ff276311010a19ceb691d022843c7bc59a2fd6cdd')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -o addopts=""
    -o filterwarnings=""
    --deselect tests/test_fields.py::TestPytzNaiveDayLightSavingTimeTimeZoneDateTimeField::test_invalid_inputs
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}

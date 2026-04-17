# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.6.11
pkgrel=1
pkgdesc='The ultimate Python library in building OAuth and OpenID Connect servers & clients'
arch=(any)
url='https://github.com/authlib/authlib'
license=(BSD-3-Clause)
depends=(
  python
  python-cryptography
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-pytest-django
  python-pytest-env
  python-requests
  python-django
  python-flask-sqlalchemy
  python-httpx
  python-starlette
  python-cachelib
  python-pycryptodomex
  python-python-multipart
)
source=("$pkgname::git+$url#tag=v$pkgver" )
sha512sums=('8fa5736d550b3d52fc0f64832feaccbb7d10c27a6c7b3092a391fbcce8e3648e8a15f8629cf28ccb171ea5b6e1c346220d4dd8b4d4f8d27e35980be955435a05')
b2sums=('bf6879f2fbeb9bcb51f5f087a16f8e4225358e48c42085b3a31cce881e37774f2ec8ed58d802b475a8bd4d4511659b4857e78bd578714d21c2e0dd6288a295aa')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  export PYTHONPATH="$PWD"
  pytest tests/core -v
  pytest tests/jose -v
  pytest tests/clients -v
  pytest tests/flask -v
  pytest tests/django -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-allauth
_name=${pkgname#python-}
pkgver=65.20.1
pkgrel=1
pkgdesc="Authentication, registration, account management and 3rd party account authentication"
arch=(any)
url="https://codeberg.org/allauth/django-allauth"
license=(MIT)
# NOTE: Upstream seems to be of the opinion that indirectly depending on a set of libraries is just fine.
# So we have a growing list of false-positive dependencies that we are not supposed to add as direct dependencies...
# python-django-rest-framework: https://codeberg.org/allauth/django-allauth/issues/4431
# python-django-ninja: https://codeberg.org/allauth/django-allauth/issues/4432
depends=(
  python
  python-asgiref
  python-django
  python-pyyaml  # implicitly required but not specified
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-cryptography
  python-django-ninja
  python-django-rest-framework
  python-fido2
  python-oauthlib
  python-openid
  python-pillow
  python-pytest
  python-pytest-asyncio
  python-pytest-django
  python-pyjwt
  python-psycopg2
  python-qrcode
  python-requests
  python-requests-oauthlib
  python-saml
)
optdepends=(
  'python-cryptography: for social account support'
  'python-fido2: for MFA support'
  'python-openid: for OpenID and Steam support'
  'python-oauthlib: for OIDC IdP support'
  'python-pyjwt: for social account and OIDC IdP support'
  'python-qrcode: for MFA support'
  'python-requests: for social account support'
  'python-requests-oauthlib: for social account support'
  'python-saml: for SAML support'
)
source=("$pkgname::git+https://codeberg.org/allauth/django-allauth.git#tag=${pkgver}")
sha512sums=('d85686337013e3e5341d0f6c4cb1bc6104096c3a3dc52207c4e88f4711987fcd91c96f8571330db9b882fafc8090ffdedc719071af291c3a7cec7fe32ff0f9ea')
b2sums=('decb53f5f904ac2ff13b632e5a8e36dba2e9f205a4464ab801e8b86eeb4f9af12995a02b6264738dff63f3e15d31303de19d01e5edd9601de4a0694ede7be897')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  pytest -vv
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

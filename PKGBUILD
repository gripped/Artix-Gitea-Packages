# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-allauth
_name=${pkgname#python-}
pkgver=65.16.0
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
sha512sums=('ae89944b8905f717c03208b8a4882d55055207cfbd93f7eb1ef8b95b2adb003c7578bf3a9c7f85d2516633a19d68a4d76b611a761bc957b9a3334439945954c3')
b2sums=('7848c8be32f7b66c9eaf404fde2ff08aa121afed332c2441f50f8cf71595abef2de89d32bb90cdb035f6f256527014a63afbc6a87ffb1bd47bbc8d29793ec11d')

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

# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-allauth
pkgname=python-django-allauth
pkgver=0.57.0
pkgrel=1
pkgdesc="Authentication, registration, account management and 3rd party account authentication"
arch=(any)
url="https://github.com/pennersr/django-allauth"
license=(MIT)
depends=(
  python
  python-django
  python-openid
  python-requests
  python-requests-oauthlib
  python-pyjwt
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pillow
  python-pytest
  python-pytest-django
  python-qrcode
  python-saml
)
optdepends=(
  'python-qrcode: for MFA support'
  'python-saml: for SAML support'
)
source=($_name-$pkgver.tar.gz::https://github.com/pennersr/$_name/archive/$pkgver.tar.gz)
sha512sums=('e68ccfbc7ae3be521bb6535cbab4f5aaa4809bf9183f0e9675026a07f4b2583d2b4ec5e55823c19224be6280469576101e4c5378e30b5c218ed5266879e78744')
b2sums=('1c980a1c772059be115458879182a3b2b8a6ad8193d2d0cf5429b77fbe6190f42e0849e6850822e4d1e0657dc53b38ab6b4d8be52688f069817cceb0c15d509b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  python manage.py test allauth
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>

pkgname=python-requests-toolbelt
pkgver=1.0.0
pkgrel=5
pkgdesc="A toolbelt of useful classes and functions to be used with python-requests."
arch=('any')
url="https://github.com/requests/toolbelt"
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-betamax' 'python-ndg-httpsclient' 'python-pyopenssl'
              'python-trustme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/requests/toolbelt/archive/$pkgver.tar.gz"
         urllib3-2.patch::https://patch-diff.githubusercontent.com/raw/requests/toolbelt/pull/356.patch)
sha512sums=('1ee5d5dbb0d140796c81d42c051ccfab8810bf5ec511b32c9a54b4adccbab460f3108acdfe5a65b3cb68377586ff0f55206bf231e64651aaea077feda7984953'
            'a4037db7c9dafb33a5ee6a33a1a4e2d748971f6512c9497c447fdeddf4513c194e4b6b46648faa6a6b008b359ed05511a8450827f85759cc8edee35d78aaa456')

prepare() {
  cd toolbelt-$pkgver
  patch -p1 -i ../urllib3-2.patch
}

build() {
  cd toolbelt-$pkgver
  python setup.py build
}

check() {
  cd toolbelt-$pkgver
  pytest
}

package() {
  cd toolbelt-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

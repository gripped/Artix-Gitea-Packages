# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: nesl247 <nesl247@gmail.com>

pkgbase=pycups
pkgname=('python-pycups')
pkgver=2.0.1
pkgrel=7
arch=('x86_64')
url="https://github.com/OpenPrinting/pycups"
license=('GPL-2.0-or-later')
pkgdesc="Python bindings for libcups"
depends=('libcups' 'python' 'glibc')
makedepends=('python-setuptools')
provides=('pycups')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/OpenPrinting/pycups/archive/v${pkgver}.tar.gz)
sha256sums=('cf7e63b07e2dbc6811e77f55cc11d7191799298a6565b83fc028ee3c9da0ad78')

build() {
  cd ${pkgbase}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgbase}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

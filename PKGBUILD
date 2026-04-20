# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-osc-lib
pkgver=4.4.0
pkgrel=1
pkgdesc="OpenStackClient Library"
arch=('any')
url="https://docs.openstack.org/osc-lib/latest/"
license=('Apache-2.0')
depends=('python-pbr' 'python-cliff' 'python-keystoneauth1' 'python-openstacksdk' 'python-oslo-i18n'
         'python-oslo-utils' 'python-requests' 'python-stevedore')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-fixtures' 'python-oslotest' 'python-requests-mock' 'python-stestr'
              'python-testrepository' 'python-testtools')
source=("git+https://github.com/openstack/osc-lib.git#tag=$pkgver")
sha512sums=('4eb0c1da3911f78962e8716f2fdd664237cfac70f4ea0c87795096e169a0e3683fd8e5d381ed91798f7fdde9f87f3ff4f49d57d10699d27032d4c0c440981514')

build() {
  cd osc-lib
  python -m build --wheel --no-isolation
}

check() {
  cd osc-lib
  stestr run
}

package() {
  cd osc-lib
  python -m installer --destdir="$pkgdir" dist/*.whl
}

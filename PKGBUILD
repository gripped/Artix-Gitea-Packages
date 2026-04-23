# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-db
pkgver=16.0.0
pkgrel=1
pkgdesc="OpenStack Database Pattern Library"
arch=('any')
url="https://pypi.org/project/oslo.db/$pkgver/"
license=('Apache-2.0')
depends=('python-pbr' 'python-alembic' 'python-debtcollector' 'python-oslo-i18n'
         'python-oslo-config' 'python-oslo-utils' 'python-sqlalchemy1.4' 'python-stevedore')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-testresources' 'python-testscenarios' 'python-eventlet' 'python-oslotest'
              'python-oslo-context' 'python-stestr' 'python-testtools' 'pifpaf' 'python-psycopg2')
optdepends=('python-testresources: for sqlalchemy test fixtures'
            'python-testscenarios: for sqlalchemy test fixtures')
options=('!emptydirs')
source=("git+https://github.com/openstack/oslo.db.git#tag=$pkgver")
sha512sums=('259a356cb80a5b628c5404ef3f3e232edeb017221f2159dd0691d86cb3e31f7b3e1d6f6d1ca3f8bb689cdb5f17c5bc890f08dc330f79fe41c89698e0ff7aed3b')

build() {
  cd oslo.db
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.db
  SQLALCHEMY_SILENCE_UBER_WARNING=1 stestr run
}

package() {
  cd oslo.db
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

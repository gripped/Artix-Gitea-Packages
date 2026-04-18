# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-osc-lib
pkgver=4.3.0
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
sha512sums=('152358238a60f93a876dc546ea3187a8c0afee61e48fd7624e83f2f617570f61cd3f2f1d546d3f9c3966e5625d0f069c1dd056bed06f798fa7d1dbd3e8eaee8f')

prepare() {
  cd osc-lib
  # Fix test expectations for program name in argparse usage line
  sed -i "s/parser = argparse.ArgumentParser(/parser = argparse.ArgumentParser(prog='run.py', /g" \
    osc_lib/tests/utils/test_tags.py
}

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

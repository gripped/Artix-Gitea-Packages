# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-openstacksdk
pkgver=4.21.0
pkgrel=1
pkgdesc="An SDK for building applications to work with OpenStack"
arch=('any')
url="https://docs.openstack.org/openstacksdk"
license=('Apache-2.0')
depends=('python-cryptography' 'python-decorator' 'python-dogpile.cache' 'python-iso8601'
         'python-jmespath' 'python-jsonpatch' 'python-keystoneauth1' 'python-os-service-types'
         'python-pbr' 'python-platformdirs' 'python-psutil' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-ddt' 'python-fixtures' 'python-hacking' 'python-jsonschema'
              'python-oslo-config' 'python-oslotest' 'python-prometheus_client'
              'python-requests-mock' 'python-stestr' 'python-testscenarios' 'python-testtools'
              'python-keyring')
source=("git+https://github.com/openstack/openstacksdk.git#tag=$pkgver")
sha512sums=('64add62e20375b11609903b9c4246e0294a65c4bbd38b19b7f53a0b3fa0cc0bbd9a82a8e97af00b33ffe8ad188d5838f23e59c1b0309a19a4dc43381392f2b41')

build() {
  cd openstacksdk
  python -m build --wheel --no-isolation
}

check() {
  # From https://github.com/openstack/openstacksdk/blob/master/tox.ini
  export OS_LOG_CAPTURE=true OS_STDOUT_CAPTURE=true OS_STDERR_CAPTURE=true

  # Deprecationwarnings break the tests, so we exclude these tests
  # TestConnection.test_create_unknown_proxy and test_unsupported_version_override
  # test_ost_version checks if os-service-types is at the latest version, but we use the latest available

  cd openstacksdk
  # TODO: package statsd?
  stestr run --exclude-regex "openstack.tests.unit.test_stats.TestStats|test_unsupported_version_override|TestConnection.test_create_unknown_proxy|test_ost_version"
}

package() {
  cd openstacksdk
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

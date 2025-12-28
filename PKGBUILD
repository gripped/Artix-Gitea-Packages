# Maintainer: Christian Rebischke <chris.rebischke at archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor:  kpcyrd <git@rxv.cc>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: flaccid aka Chris Fordham <chris@fordham.id.au>
# Contributor: Sparadox <etienne.lafarge at gmail.com>

pkgname=cloud-init
pkgver=25.3
pkgrel=2
pkgdesc="Cloud instance initialization"
arch=(any)
url="https://cloud-init.io"
_url="https://github.com/canonical/cloud-init"
license=('GPL-3.0-only OR Apache-2.0')
depends=(
  bash
  dhcp-client
  openbsd-netcat
  python
  python-configobj
  python-jinja
  python-jsonpatch
  python-jsonschema
  python-netifaces
  python-oauthlib
  python-pyserial
  python-pyyaml
  python-requests
  python-typing_extensions
  sudo
)
makedepends=(
  bash-completion
  meson
#  netplan
  udev
)
checkdepends=(
  procps-ng
  python-httpretty
  python-passlib
  python-pytest
  python-pytest-mock
  python-responses
)
optdepends=(
  'cloud-guest-utils: for growpart'
#  'netplan: for configuring network using netplan'
  'python-passlib: for Azure and BSD support'
  'python-urllib3: for LXD and Scaleway data sources'
)
backup=(
  etc/cloud/cloud.cfg
  etc/cloud/cloud.cfg.d/05_logging.cfg
)
source=(
  $_url/archive/$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname-25.3-skip_openrc_check.patch
)
sha512sums=('f881cac48fcb421fc07a435cd7a1acdf0b0c13aebf997af3100ecaca276e595a7ddaf778cff817c385a6b0103a36e326a5eeb8e281e8ef270ba2a4508d91168d'
            '64a49d8359fe7d51a5cf8449abab792b00d1bc910ab7928201af6f2fec87486a3658ee6d06e13c789b40618428bf209be56cd5c79dbdf3736f99ef85db08783c')
b2sums=('c49494ce91200f54a194554c19067f6533587fe3caebaf54e71d99548dcb956545ae709a775e09fad33a84702043b4e311626103c42b7d72190d1304bc45bdb3'
        'b4805b7842bae79105d8963776f635067d4b0c9aab5a5c9ac311f6d754082923f2ab1faa9a867e4bcbc91923d0512d38f21527712a5b25b3ad431a189ca60c07')

prepare() {
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-25.3-skip_openrc_check.patch
}

build() {
  artix-meson $pkgname-$pkgver build -Dinit_system=sysvinit_openrc
  meson compile -C build
}

check() {
  local pytest_options=(
   -vv
    # we don't ship /etc/ca-certificates.conf
    --deselect tests/unittests/config/test_cc_ca_certs.py::TestRemoveDefaultCaCerts::test_commands
    --deselect tests/unittests/test_ds_identify.py::TestWSL::test_empty_cloudinitdir
    --deselect tests/unittests/test_ds_identify.py::TestWSL::test_found_via_userdata
    --deselect tests/unittests/config/test_schema.py::TestNetplanValidateNetworkSchema::test_network_config_schema_validation_false_when_skipped
    --deselect 'tests/unittests/config/test_schema.py::TestNetworkSchema::test_network_schema[net_v2_complex_example]'
    --deselect 'tests/unittests/config/test_schema.py::TestNetworkSchema::test_network_schema[net_v2_invalid_config]'
    --deselect 'tests/unittests/config/test_schema.py::TestNetworkSchema::test_network_schema[net_v2_skipped]'
  )
  cd $pkgname-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  meson install -C build --destdir "$pkgdir"
}

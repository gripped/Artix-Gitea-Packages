# Maintainer: capezotte <capezotte@artixlinux.org>
# Contributor: Christian Rebischke <chris.rebischke at archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor:  kpcyrd <git@rxv.cc>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: flaccid aka Chris Fordham <chris@fordham.id.au>
# Contributor: Sparadox <etienne.lafarge at gmail.com>

pkgbase=cloud-init
pkgname=(cloud-init cloud-init-openrc)
pkgver=26.2
pkgrel=1
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
  python-referencing  # transitive dependency via python-jsonschema: https://github.com/canonical/cloud-init/issues/6986
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
  python-pyfakefs
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
  "$pkgbase-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz"
  "$pkgbase-25.3-skip_openrc_check.patch"
)
sha512sums=('8826c2fba9ef4125121792390314a1b151ea9e004ad2db11a030881b99754884eb14c158eb497cf4c311e3b8cb5161ea5d9906838719666216f4a6430c9e18f4'
            '64a49d8359fe7d51a5cf8449abab792b00d1bc910ab7928201af6f2fec87486a3658ee6d06e13c789b40618428bf209be56cd5c79dbdf3736f99ef85db08783c')
b2sums=('4efb181700014b906b12e39b47a9d64efea7871ad5fc6176cb3709b6c6523c1175fdaea36f6e91fc03abe405dce6fb27e9151e6d5520da5cba7bcbb1914c2cc6'
        'b4805b7842bae79105d8963776f635067d4b0c9aab5a5c9ac311f6d754082923f2ab1faa9a867e4bcbc91923d0512d38f21527712a5b25b3ad431a189ca60c07')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  cd "$pkgbase-$pkgver"
  patch -Np1 < "$srcdir/$pkgbase-25.3-skip_openrc_check.patch"
}

build() {
  artix-meson "$pkgbase-$pkgver" build -Dinit_system=sysvinit_openrc
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
  cd "$pkgbase-$pkgver"
  pytest "${pytest_options[@]}"
}

package_cloud-init() {
  meson install -C build --destdir "$pkgdir" 
  ( cd "$pkgdir" && _pick openrc etc/init.d )
}

package_cloud-init-openrc() {
  depends=(cloud-init openrc)
  optdepends=()
  provides=(init-cloud-init)
  backup=()
  pkgdesc+=" (OpenRC service files)"

  mv openrc/* "$pkgdir"
}

# vim: sw=2 et

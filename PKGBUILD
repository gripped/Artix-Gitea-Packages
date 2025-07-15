# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pynitrokey
pkgname=python-pynitrokey
pkgver=0.9.2
pkgrel=1
pkgdesc="A command line interface for the Nitrokey FIDO2 and Nitrokey Start"
arch=(any)
url="https://github.com/Nitrokey/pynitrokey"
license=(
  'Apache-2.0 OR MIT'
  LGPL-3.0-only
  GPL-3.0-or-later
)
depends=(
  nitrokey-udev-rules
  python
  python-cffi
  python-click
  python-click-aliases
  python-cryptography
  python-ecdsa
  python-fido2
  python-intelhex
  python-nethsm
  python-nitrokey
  python-nkdfu
  python-pyserial  # implicit via python-nitrokey
  python-pyusb
  python-requests
  python-semver
  python-tlv8
  python-tqdm
)
makedepends=(
  git
  python-build
  python-poetry-core
  python-installer
  python-wheel
)
# NOTE: there are no tests to run
optdepends=(
  'python-libusb1: for pro and storage subcommands'
  'python-pyscard: for PC/SC support'
)
source=(
  "$_name::git+$url.git?signed#tag=v$pkgver"
)
sha512sums=('5e409ca5b4976aaff6356cc2adaee7540ce9578404b1d00390f02efcead520f69f13cb4e87b5b1a9a1b7a6397153786acf8b46edf4770f6ed0b2ea714c783666')
b2sums=('a51cbfc20bc37745b74976f624f50db554043cab29cca56673d9ea24e28aaaef0cc4005e0774bc0d6e30381b03c865cb1dc665bc15e5d83a2e7e099fa4d07986')
validpgpkeys=(
  868184069239FF65DE0BCD7DD9BAE35991DE5B22  # Szczepan Zalega <szczepan@nitrokey.com> (@szszszsz)
  CC74B7120BFAA36FF42868724C1449F1C9804176  # Markus Meissner <meissner@nitrokey.com> (@daringer)
  719EA31C3F1814DA787C8FD434F47D2F044B8F17  # Robin Krahl <robin@nitrokey.com> (@robin-nitrokey)
  93CCB0DB717DAE30622F671436DA48A4C827B354  # Sosthène Guédon <sosthene@nitrokey.com> (@sosthene-nitrokey)
)

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

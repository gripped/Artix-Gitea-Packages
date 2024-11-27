# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>
# Contributor: fordprefect <fordprefect@dukun.de>
# Contributor: Thor77 <thor77@thor77.org>

pkgname=radicale
_name=Radicale
pkgver=3.3.0
pkgrel=2
pkgdesc="Simple calendar (CalDAV) and contact (CardDAV) server"
arch=(any)
url="https://radicale.org/"
_url="https://github.com/Kozea/radicale"
license=(GPL-3.0-or-later)
depends=(
  python
  python-bcrypt
  python-dateutil
  python-defusedxml
  python-passlib
  python-pika
  python-vobject
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-waitress
)
backup=(
  'etc/radicale/config'
  'etc/radicale/rights'
  'etc/radicale/users'
)
install=$pkgname.install
source=(
  $pkgname-$pkgver.tar.gz::$_url/archive/v$pkgver.tar.gz
  $pkgname-sysusers.conf
  $pkgname-tmpfiles.conf
)
sha512sums=('02d4f1a6d2e298b74d7076d90a0bc2dc60e6d4b29b37279de3a15f4c1db7c9996685400c4899399a39693abd02b383c4862a59d6720292517543600c7b25fc06'
            '56dffb66e018cfbf158dc5d8fe638b3cb31229945f659aae5623f219bcd1d68ddc375f1633fa8e857a9b2f50c9e05a06efce165370137d6e116a4f187466637f'
            '9d0dd88e4a34e9f97abda1785698e4b2a5e8202063deeb91b84e13c05e00b07e45b8d4d9eca09b9241b1138bbbfdc999dba0135c18f5bc0c08d65b0cd83b367b')
b2sums=('5581e45b20d04d14d43cf4d133e6de001931beaa1100cff25c7726dac26ab03e008dd3cc5f85c69d6a8a6940d591a548d0e287aa5a9dd1194ea842ab94f8465f'
        'b3af60e144ef857e42ec672e806e9600265ab7d2ea4a75011de9ab56918a008437afdacb301df210b54424fb7ff1e9a332831c67b2e58fd6bc0a0aa1eebe8909'
        '41916d62f5e3f1060bd21db0722abe837754a4cb915af218c904dafac4b06794f8fde2e34486fb7392777b4738502f3df4c1390b835050045337585b064e23bb')

prepare() {
  cd $_name-$pkgver
  touch "users"
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -o addopts=""
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # config
  install -vDm 644 {config,rights,users} -t "$pkgdir/etc/$pkgname/"
  # wsgi
  install -vDm 644 $pkgname.wsgi -t "$pkgdir/usr/share/$pkgname/"
  # systemd service
  # sysusers.d
  install -vDm 644 ../$pkgname-sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  # tmpfiles.d
  install -vDm 644 ../$pkgname-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  # docs
  install -vDm 644 {CHANGELOG,DOCUMENTATION,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Moritz Lipp <mlq@pwmt.org>
# Contributor: fordprefect <fordprefect@dukun.de>
# Contributor: Thor77 <thor77@thor77.org>

pkgname=radicale
_name=Radicale
pkgver=3.6.0
pkgrel=1
pkgdesc="Simple calendar (CalDAV) and contact (CardDAV) server"
arch=(any)
url="https://radicale.org/"
_url="https://github.com/Kozea/radicale"
license=(GPL-3.0-or-later)
depends=(
  python
  python-bcrypt
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
optdepends=(
  'python-ldap3: for LDAP authentication'
  'python-pam: for PAM authentication'
  'python-requests: for OAuth2 authentication'
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
sha512sums=('c091da37da4da4319f8c7651f8eb7bf3162b765667e718afef0849432f8b634fcb666a29cfd68698189ffc25b30dde612232d3dae5f965fd879e0b16e7c14ceb'
            '602b29275f9b15f7d57a4f965bba3327dfa0e4d1d961f6969ba99bb4dbc212ea04afa2878109210a8ff0e70f958abb233c59389ce4f9781bd21ca823026b1f04'
            '9d0dd88e4a34e9f97abda1785698e4b2a5e8202063deeb91b84e13c05e00b07e45b8d4d9eca09b9241b1138bbbfdc999dba0135c18f5bc0c08d65b0cd83b367b')
b2sums=('c4daeee664886e7bf3738596cfd4d7355d2ee1a8c103c660eef7a7523dce7da55ef832bec51fd8ccec6d6f9d217f1866767e61bd796992db884af6f0a5689f94'
        '399e6ffbe1fe2d4ab36439efda22e44fda08d059ff82bdf30c3db55adcddc5c96aedf2ac94f9d1dea1d1cb9fe6cc9e2e7fcb49e2f0006b844dd2906d49d6df65'
        '41916d62f5e3f1060bd21db0722abe837754a4cb915af218c904dafac4b06794f8fde2e34486fb7392777b4738502f3df4c1390b835050045337585b064e23bb')

prepare() {
  cd $_name-$pkgver
  touch "users"

  # replace libpass dependency with the original passlib
  # https://github.com/notypecheck/passlib/issues/11#issuecomment-3743518743
  # https://github.com/Kozea/Radicale/discussions/1965
  sed -i 's|libpass[^"]*|passlib|' pyproject.toml
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

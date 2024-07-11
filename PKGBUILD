# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=2.11.0
pkgrel=1
pkgdesc='An ACME client'
arch=('any')
license=('Apache-2.0')
url='https://certbot.eff.org'
depends=(
  'ca-certificates'
  "python-acme=$pkgver"
  'python-configargparse'
  'python-configobj'
  'python-cryptography'
  'python-distro'
  'python-parsedatetime'
  'python-pyrfc3339'
  'python-pytz'
  'python-setuptools'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-sphinx'
  'python-sphinx_rtd_theme'
)
checkdepends=('python-pytest')
optdepends=(
  'certbot-apache: Apache plugin for Let’s Encrypt client'
  'certbot-nginx: Nginx plugin for Let’s Encrypt client'
)
replaces=('letsencrypt')
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo="github.com-certbot-certbot"
source=(
  "$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver"
  'tmpfiles.conf'
)
sha512sums=('92edffc2662902eb2617d473486301ecf2a80c129963e21236a01d4b6450fe4cc02032e4c4afe28c18a47cffc301b33e9f435eaeebc75a05d3ce776898e666d3'
            'fbb7bb4591876aeb2e118c3f3fc8ff507b6a3127de0f921c689e1d74c70320b4f2b8bf05b488ec4f714259701f1ac54e64a9f6181475da6bd6d1e3da3a602217')
b2sums=('feed7a8f8ad7f1709a33a1fe4f71111679b1506e48625529821edcd4a183155a4483e4e9376dc5a0f3caeb32f2cb363c0856754baee59f4b7b4f110b6b38ee45'
        '7d2c26a9953d3b5a899053bdd7bd77051c67abe6480af2bfaaee06f20a399b0b4ccccc0af35cfe9e6d2b1fc833dbff928ba46771a9127720073dda29aef9a2e0')

prepare() {
  cd "$_repo/$pkgname"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py
}

build() {
  cd "$_repo/$pkgname"

  python -m build --wheel --no-isolation

  # create man pages
  make -C docs man
}

check() {
  cd "$_repo/$pkgname"

  # https://github.com/certbot/certbot/issues/9606
  python -m pytest -W ignore::DeprecationWarning
}

package() {
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$_repo/$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # sometimes Python packaging tools don't set the correct permissions...
  chmod 755 "$pkgdir"/usr/bin/*

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
  install -vDm644 -t "$pkgdir/usr/share/man/man7" docs/_build/man/*.7
}

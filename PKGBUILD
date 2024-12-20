# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=3.0.1
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
checkdepends=('python-pytest' 'python-chardet')
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
sha512sums=('5dab3eee263512e7a3cb5829ca2ebec60b135a001d9a6ff204894fd4496c94a119dab5b36fa11f779542d836d4d15ae8ca7afa1ce25bcf4744b70b5a0cd90b4a'
            'fbb7bb4591876aeb2e118c3f3fc8ff507b6a3127de0f921c689e1d74c70320b4f2b8bf05b488ec4f714259701f1ac54e64a9f6181475da6bd6d1e3da3a602217')
b2sums=('632f910dbbc3059811cb5ca921af20d98374d029b1ce8bde1fa6d947773b52c8d19534c82ba0b9e85286d9c97741e69ae4f34a4c1d4675843785bba60147994d'
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

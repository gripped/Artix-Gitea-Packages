# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=3.3.0
pkgrel=2
pkgdesc='An ACME client'
arch=('any')
license=('Apache-2.0')
url='https://certbot.eff.org'
depends=(
  'ca-certificates'
  'python'
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
  'dd876a40-minus-changelog.patch'
)
sha512sums=('893a291ee08ce75d1690d2b1c8622977b02345483e5828a4605c34feb5d3da94e1872f53b2e28bf8dea07044bab9af9b3751e815ae89bc2641be309569384e1a'
            'fbb7bb4591876aeb2e118c3f3fc8ff507b6a3127de0f921c689e1d74c70320b4f2b8bf05b488ec4f714259701f1ac54e64a9f6181475da6bd6d1e3da3a602217'
            '72fa6bea1fb02f3ee6fa61785360e1f02f20671b4310909cbc44a0f6016b12e1e1099fbeb6c8d90e27b2d1784f6c3866d06f800c120159636eba96a0f9ce3ccb')
b2sums=('d8d5ef1244e23705224d7642001356266cee802c9f82f828b1807b8ffa1656596a97467e1db5cd1e520b09dc6c9ef6c21bd86ed4c7cf4582bb7f96dfebc4fb6f'
        '7d2c26a9953d3b5a899053bdd7bd77051c67abe6480af2bfaaee06f20a399b0b4ccccc0af35cfe9e6d2b1fc833dbff928ba46771a9127720073dda29aef9a2e0'
        '519459ff02dd805ae202ff3e3462d10ee5efabb6f0945621f6b55abaff7aca3337db87b3bef99c66d07a38f4f89a498e32f3d1f7375f1afaae32077077bc8373')

prepare() {
  cd "$_repo/$pkgname"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py

  # backport fix for josepy/cryptography/pyopenssl
  cd ..
  patch -p1 -i "$srcdir/dd876a40-minus-changelog.patch"
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

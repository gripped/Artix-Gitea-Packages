# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=5.7.0
pkgrel=1.1
pkgdesc='An ACME client'
arch=(any)
license=(Apache-2.0)
url='https://certbot.eff.org'
depends=(
  ca-certificates
  python
  "python-acme=$pkgver"
  python-configargparse
  python-configobj
  python-cryptography
  python-distro
  python-josepy
  python-parsedatetime
  python-pyrfc3339
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-sphinx
  python-sphinx_rtd_theme
)
checkdepends=(
  python-pytest
  # dependencies for certbot[nginx,apache]
  # all code from certbot-{nginx,apache} moved into certbot as of v5.5.0
  python-augeas
  python-pyopenssl
  python-pyparsing
)
optdepends=(
  'certbot-apache: Apache plugin for Let’s Encrypt client'
  'certbot-nginx: Nginx plugin for Let’s Encrypt client'
)
replaces=(letsencrypt)
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo='github.com-certbot-certbot'
source=(
  "$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver"
  tmpfiles.conf
)
sha512sums=('8bf169295968b9a54dbf2be45239ba46d758fa4e1fa72f468f750b7ed001028f583f564204a95dd277743b5efc1c5202d6fc7d9948579e39be1c853193ade9dd'
            'fbb7bb4591876aeb2e118c3f3fc8ff507b6a3127de0f921c689e1d74c70320b4f2b8bf05b488ec4f714259701f1ac54e64a9f6181475da6bd6d1e3da3a602217')
b2sums=('366ef334b4cfdd48b138a8b5f6fe15b6ffd97af2ba575e246fe92fb1f5a80eb4e1b8e7d350f5483309ee5ce70b7af0e55774e719b98fbe1f3c8066da00ce3c83'
        '7d2c26a9953d3b5a899053bdd7bd77051c67abe6480af2bfaaee06f20a399b0b4ccccc0af35cfe9e6d2b1fc833dbff928ba46771a9127720073dda29aef9a2e0')

build() {
  cd "$_repo/$pkgname"

  python -m build --wheel --no-isolation

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install$site_packages"

  # create man pages
  make -C docs man
}

check() {
  cd "$_repo/$pkgname"

  # install to temporary directory
  #python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  #local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  #export PYTHONPATH="$PWD/tmp_install$site_packages"

  # https://github.com/certbot/certbot/issues/9606
  python \
    -m pytest \
    -W ignore::DeprecationWarning \
    --import-mode=importlib \
    src/certbot
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

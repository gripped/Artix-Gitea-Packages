# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=5.3.1
pkgrel=1
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
checkdepends=(python-pytest)
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
sha512sums=('dffae74b31d5c4f31112948c65d4503ac90021099aba0efc56c701c2deb846f29f19d1ea9e7509f79277e26c66d0df968e6b9bc6e72221c238566fc5c480d1a9'
            'fbb7bb4591876aeb2e118c3f3fc8ff507b6a3127de0f921c689e1d74c70320b4f2b8bf05b488ec4f714259701f1ac54e64a9f6181475da6bd6d1e3da3a602217')
b2sums=('bd038c82b529f18ec964c9a4f640d1183a3dbf65ae8e9d4d39974d755a06e4ecc5385735d08e0793105b6267733f133b63480b2c9c7859f28a2cac56233ec639'
        '7d2c26a9953d3b5a899053bdd7bd77051c67abe6480af2bfaaee06f20a399b0b4ccccc0af35cfe9e6d2b1fc833dbff928ba46771a9127720073dda29aef9a2e0')

build() {
  cd "$_repo/$pkgname"

  python -m build --wheel --no-isolation

  # create man pages
  make -C docs man
}

check() {
  cd "$_repo/$pkgname"

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install$site_packages"

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

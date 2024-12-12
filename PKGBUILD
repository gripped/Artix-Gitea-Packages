# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Adam Fontenot <adam.m.fontenot@gmail.com>

pkgname=breezy
pkgver=3.3.9
pkgrel=3
pkgdesc='A decentralized revision control system with support for Bazaar and Git file formats'
arch=(x86_64)
url=https://www.breezy-vcs.org/
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
  python
  python-configobj
  python-dulwich
  python-fastbencode
  python-merge3
  python-patiencediff
  python-tzlocal
  python-yaml
)
makedepends=(
  cython
  git
  python-build
  python-fastimport
  python-gpgme
  python-installer
  python-packaging
  python-paramiko
  python-setuptools
  python-setuptools-gettext
  python-setuptools-rust
  python-wheel
)
checkdepends=(
  python-subunit
  python-testscenarios
  python-testtools
)
optdepends=(
  'python-fastimport: Fastimport support'
  'python-gpgme: PGP support'
  'python-paramiko: access branches over SFTP'
)
provides=(bzr)
conflicts=(bzr)
replaces=(bzr)
source=(
  "https://launchpad.net/brz/${pkgver%.*}/$pkgver/+download/breezy-$pkgver.tar.gz"
  "https://launchpad.net/brz/${pkgver%.*}/$pkgver/+download/breezy-$pkgver.tar.gz.asc"
  "0001-Adapt-to-GPGME-handling-invalid-GPG-data-in-signatur.patch"
)
sha256sums=('c2588bf217c8a4056987ecf6599f0ad9fb8484285953b2e61905141f43c3d5d8'
            'SKIP'
            '3a1176252ec763983fa017d9fc70fcee38ecff5f2438b81dd3dbef66772b8c19')
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../0001-Adapt-to-GPGME-handling-invalid-GPG-data-in-signatur.patch
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  # Excluded tests are flaky, failing with the following error, at least when
  # run in parallel:
  # ssl.SSLError: [SYS] unknown error (_ssl.c:2570)
  "$PWD/tmp_install/usr/bin/brz" selftest \
    --parallel=fork \
    --verbose \
    --exclude="breezy.bzr.tests.test_read_bundle.TestReadMergeableBundleFromURL" \
    -Oselftest.timeout=120 ||:
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  ln -s /usr/bin/brz "$pkgdir/usr/bin/bzr" # backwards compatibility
}

# vim: ts=2 sw=2 et:

# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-dbusmock
pkgver=0.34.1
pkgrel=1
pkgdesc="Mock D-Bus objects for tests"
url="https://github.com/martinpitt/python-dbusmock"
arch=(any)
license=(LGPL-3.0-or-later)
depends=(
  glib2
  python
  python-dbus
  python-gobject
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
source=("git+https://github.com/martinpitt/python-dbusmock#tag=$pkgver")
b2sums=('f20c52064607e1db07bdb86548247e6be5fa1f16d154dc5243b5dda7593a4eeb42733add8bebbf6a8de3c76b0a285ece9149602dd681383b27e82a6f5086caa1')
validpgpkeys=(
  3DB46B55EFA59D40E6232148D14EF15DAFE11347 # Martin Pitt <martin@piware.de>
)

prepare() {
  cd $pkgname
}

build() {
  cd $pkgname

  # Suppress local version
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver%%+*}"

  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set sw=2 sts=-1 et:

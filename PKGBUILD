# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pipx
pkgname=python-$_pkgname
pkgver=1.11.2
pkgrel=1
pkgdesc='Install and Run Python Applications in Isolated Environments'
arch=('any')
url='https://github.com/pypa/pipx'
license=('MIT')
depends=('python' 'python-userpath' 'python-argcomplete' 'python-packaging' 'python-platformdirs')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-hatch-vcs')
#checkdepends=('python-tox' 'python-pytest')
source=(git+https://github.com/pypa/pipx.git#tag=${pkgver})
sha512sums=('f78c95d8f1e3a3ad0c8f51224bc7fad9fceebb89d10c5ce25afd11d8c87dd6c33d26b51aa330f3059b6759923d73d889ac5d3a3b3761d65674ed8778097d8f5a')

build() {
  cd $_pkgname

  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python -m build -nw
}

#check() {
#  cd $_pkgname
#
#  nox
#}

package() {
  cd $_pkgname

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

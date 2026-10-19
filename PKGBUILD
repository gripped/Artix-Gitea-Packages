# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-bracex
pkgver=3.1.0
pkgrel=1
pkgdesc='Bash style brace expansion for Python'
arch=('any')
url='https://github.com/facelessuser/bracex'
license=('MIT')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("https://github.com/facelessuser/bracex/archive/${pkgver}/bracex-${pkgver}.tar.gz")
b2sums=('9284633a9b10670ac1aa1d572e081fd24932aa3a37350b44e289b8104252e58936c28894fc23d4c04c7ca3f85cc0cf4092871b7572d3543e7400a7f3ff29aeb7')

build() {
  cd bracex-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd bracex-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

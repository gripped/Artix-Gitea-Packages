# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=yamllint
pkgver=1.36.1
pkgrel=1
pkgdesc='Linter for YAML files'
arch=('any')
url='https://github.com/adrienverge/yamllint'
license=('GPL-3.0-or-later')
depends=('python' 'python-pathspec' 'python-yaml')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('d895c4169a988884048e52af586fac91c7df083b8c27c69d90f4d2e4a218d2fd89c7cc4346f036ee6902b99446cc0fb27d1f3bebd0d079a8c4794a6c6174da79')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  python -m unittest discover tests
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

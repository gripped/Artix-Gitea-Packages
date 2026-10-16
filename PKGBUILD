# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-executing
_name=${pkgname#python-}
pkgver=2.3.0
pkgrel=1
pkgdesc='Get the currently executing AST node of a frame, and other information'
arch=(any)
url=https://github.com/alexmojaki/executing
license=(MIT)
depends=(
  python
  python-asttokens
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  ipython
  python-asttokens
  python-littleutils
  python-pytest
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('2316daa2123cb585b2ffc43b51c9279cb7390ac79c7df5f4dee77aaa2fa420e9f2644b143f6e4f1810871003b934a2535d7125290c22397efc326716bd73f024')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  PYTHONPATH="$PWD/$_name:$PYTHONPATH" pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/licenses/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

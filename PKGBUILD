# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Łukasz Tuz <lukasz.tuz@gmail.com>

pkgname=python-aiohappyeyeballs
_name=${pkgname#python-}
pkgver=2.4.8
pkgrel=1
pkgdesc='Happy Eyeballs for asyncio'
arch=(any)
url=https://github.com/aio-libs/aiohappyeyeballs
license=(PSF-2.0)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('68b0b936d313eaede907db6eb855724616c932cd95cd4b05e59e982bb49ab14294de9c97642346917c20b2c706efef0711cd053a19fc597ea5fb4f8595e012d8')

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"
  # Override addopts as they invoke coverage testing
  pytest --override-ini="addopts=-v -Wdefault"
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

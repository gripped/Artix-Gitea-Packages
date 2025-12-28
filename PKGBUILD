# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

pkgname='pre-commit'
pkgver=4.4.0
pkgrel=3
pkgdesc="A framework for managing and maintaining multi-language pre-commit hooks"
url="https://github.com/pre-commit/pre-commit"
license=('MIT')
arch=('any')
depends=(
  python-cfgv
  python-identify
  python-nodeenv
  python-toml
  python-virtualenv
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
#  cabal-install
  git
#  ghc
  go
  julia
  luarocks
  nodejs
  npm
  python-pytest
  python-pytest-env
  python-re-assert
  r
  rubygems
  rust
)
provides=(
  python-pre-commit
)
replaces=(
  python-pre-commit
)
source=("https://github.com/pre-commit/pre-commit/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e0d1736d77b9759c4aa97c061d7dfb2dbe26c6b8b8c636b979d3de8cc6203773d13aacfebec7490293db87d4377640545bd97169e4bdfc63ae8e8a7d64867fdb')
b2sums=('ccc5829be668349882c8880b8fb9fc93dba317547a78f42752ea846c84cf5754126fcd9966512562537457f753357f4ce847a5ee762da20177444f779f638d14')

build() {
  cd pre-commit-$pkgver
  python -m build --wheel --no-isolation
}


package() {
  cd pre-commit-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

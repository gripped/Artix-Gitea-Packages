# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname='pre-commit'
pkgver=4.6.1
pkgrel=1
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
sha512sums=('d345cd21773911eaf1e90f17910d59794ab42c79166bf5461d9732a089e3aa3084b19e2b58fa0153fc86b7e4973506296d09afc2b32045f9ff097d3b88e187c5')
b2sums=('65103c71e11b737c6242015e9f04eea7d8b2cf2ea6a849194376b4527d1629525e35d118a122f968cc9b62aa71e9b78b87e0c69432760fdc925e400d3693111e')

build() {
  cd pre-commit-$pkgver
  python -m build --wheel --no-isolation
}


package() {
  cd pre-commit-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

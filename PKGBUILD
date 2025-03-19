# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

pkgname='pre-commit'
pkgver=4.2.0
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
  python-setuptools
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
sha512sums=('6843c56ae06c8c2cabb23e72217a1a8696ede4e4ddf2d4fae28c43076438e47e6f9d73642377b529ce629f184ece4c0076df613afff233ca1e28c5aa672f3b4a')
b2sums=('1f338e9b610f79ec4bd537ab69110f86b36e8ff2f84628b5b7a54af4312f43a358f9c8da7c54c7327512cd14ec39819aa3724009dae11c9d016ef5beae6127e8')

build() {
  cd pre-commit-$pkgver
  python setup.py build
}


package() {
  cd pre-commit-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

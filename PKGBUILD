# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-praw
pkgver=8.0.0
pkgrel=1
pkgdesc="Python Reddit API Wrapper that allows for simple access to Reddit's API"
arch=('any')
license=('BSD-2-Clause')
url="https://praw.readthedocs.org"
depends=('python-defusedxml' 'python-prawcore' 'python-update-checker' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-vcrpy')
source=("https://github.com/praw-dev/praw/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b1c9705c8c9b057f8285d5a5f35f96a89c40263c17f3c442f9e7e6fcca301f50bc05e9a05c20d404ac091dc604dfc230538b156a203e3ce4934bfe8e63b49d5b')

build() {
  cd praw-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd praw-$pkgver
  pytest
}

package() {
  cd praw-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

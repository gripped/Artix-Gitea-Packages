# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-praw
pkgver=8.0.1
pkgrel=1
pkgdesc="Python Reddit API Wrapper that allows for simple access to Reddit's API"
arch=('any')
license=('BSD-2-Clause')
url="https://praw.readthedocs.org"
depends=('python-defusedxml' 'python-prawcore' 'python-update-checker' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-vcrpy')
source=("https://github.com/praw-dev/praw/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('de3dfc278d3ee2d264d7f73c99cf961689b35b835b48eb01e94866ff41aca2a768be7fc0ea75cf9ceb4c8f285b43ad3ec2d84c791279f02231d5e1ead6bb2e0d')

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

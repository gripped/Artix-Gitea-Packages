# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Modified from aur/python2-pytrie; original maintainership info:
# Contributor: dseg

pkgname=python-pytrie
pkgver=0.4.0
pkgrel=9
pkgdesc="A pure Python implementation of the trie data structure."
url="https://github.com/gsakkis/pytrie/"
depends=(python python-sortedcontainers)
makedepends=(python-setuptools)
# Tests in this package imports tests from CPython :/
checkdepends=(python-tests)
license=(BSD)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/P/PyTrie/PyTrie-$pkgver.tar.gz"
         python-3.14.patch)
sha256sums=('8f4488f402d3465993fb6b6efa09866849ed8cda7903b50647b7d0342b805379'
            'f0cec45ff6c28e9f7f63fbda6c1563bc155b1ea62ef457d19754662deddd3207')

prepare() {
  cd PyTrie-$pkgver
  patch -p1 -i ../python-3.14.patch
}

build() {
  cd PyTrie-$pkgver
  python setup.py build
}

check() {
  cd PyTrie-$pkgver
  python -m unittest discover -v ./tests
}

package() {
  cd PyTrie-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
 

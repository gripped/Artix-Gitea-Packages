# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

pkgname=python-beniget
pkgver=0.4.2.post0
pkgrel=1
pkgdesc='A static analyzer for Python code'
arch=(any)
url='https://github.com/serge-sans-paille/beniget'
license=(BSD-3-Clause)
depends=(python
         python-gast)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
source=(git+https://github.com/serge-sans-paille/beniget#tag=$pkgver)
sha256sums=('4404611e26c0215af8f0158ab2bc1b8de07fb434b68ebd9a5ed7f1ef99e18419')

build() {
  cd beniget
  python -m build --wheel --no-isolation
}

package() {
  cd beniget
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

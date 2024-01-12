# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: farwayer <farwayer@gmail.com>

pkgname=python-colour
_pyname=colour
pkgver=0.1.5
pkgrel=11
pkgdesc="Colour representations manipulation library (RGB, HSL, web, ...)"
arch=('any')
url="https://github.com/vaab/colour"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
	'remove-d2to1.patch')
sha256sums=('af20120fefd2afede8b001fbef2ea9da70ad7d49fafdb6489025dae8745c3aee'
            'e5ac894008cb89c7dc3dfde01826d35e47a5b4520928f63c96d467c9a6faa4dc')

prepare() {
  cd $_pyname-$pkgver
  patch -Np1 -i ../remove-d2to1.patch
}

build() {
  cd $_pyname-$pkgver
  python setup.py build
}

check() {
  cd $_pyname-$pkgver
  nosetests
}

package() {
  cd $_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

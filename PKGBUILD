# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-zstandard')
_pkgname='zstandard'
pkgver=0.23.0
pkgrel=1
pkgdesc="Python bindings to the Zstandard (zstd) compression library"
url="https://github.com/indygreg/python-zstandard"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-hypothesis')
optdepends=('python-cffi')
license=('BSD')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/indygreg/python-zstandard/archive/$pkgver.tar.gz")
sha256sums=('f29233338bcef11f233737eb58aba85074f0fd3163bec1a20303de1270e6fb16')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build_ext
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    python -m unittest discover -vs .
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

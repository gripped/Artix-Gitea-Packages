# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: shmilee

pkgname=python-mistune
_pkgname=mistune
pkgver=3.3.1
pkgrel=2
epoch=1
pkgdesc="A fast yet powerful Python Markdown parser with renderers and plugins"
url="https://mistune.lepture.com"
arch=('any')
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/lepture/mistune/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('80b84ce86e1905b202006a8112f3c56ffe17d610e479b16c92bb2be32041895bea477a20612960fbb5376aa5485f7cdb3a686ae00acb7e7d503f8902197ad290')
b2sums=('fc137ed1ecfd12e77cc86ae6fa718f64ec46ee76a0148dbce0643f4612a19e5edf62472e56f08f6aab2a121e77b9ec679a03f2bf66caf66ca90e66a7224ddfc0')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgname}-${pkgver}"
	pytest
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

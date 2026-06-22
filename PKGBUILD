# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: shmilee

pkgname=python-mistune
_pkgname=mistune
pkgver=3.3.0
pkgrel=1
epoch=1
pkgdesc="A fast yet powerful Python Markdown parser with renderers and plugins"
url="https://mistune.lepture.com"
arch=('any')
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/lepture/mistune/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e515b26bf37b4f0e75110a766a0479f79444b3c6da89194e85a1b4ab7942427f94ef8085310441106c1e9595f3d5a5537328e541ddc85d304a3c521cb65dbb3d')
b2sums=('fced71e4b7f9c71a58eaabfa8974f93e4b58679f3d85f86ea87c10f2f9752dfac1768d44a6d7d4b363967fead44c52a3e5a132d19deff65a5d4485fe0c023295')

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

# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Lorenz Steinert <lsteinert+aur@uraziel.de>

pkgname=python-strawberry-graphql
_pkgname=strawberry
pkgver=0.317.1
pkgrel=1
pkgdesc="A GraphQL library for Python that leverages type annotations"
url="https://strawberry.rocks"
arch=('any')
license=('MIT')
depends=('python' 'python-graphql-core'	'python-dateutil' 'python-packaging'
         'python-cross-web' 'python-rich' 'python-typing_extensions' 'python-pygments')
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/strawberry-graphql/strawberry/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bbe900b5b7f1b15b336fddf37f5a1060579b64a0d3ee97fb961e67d727995563')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Lorenz Steinert <lsteinert+aur@uraziel.de>

pkgname=python-strawberry-graphql
_pkgname=strawberry
pkgver=0.320.0
pkgrel=1
pkgdesc="A GraphQL library for Python that leverages type annotations"
url="https://strawberry.rocks"
arch=('any')
license=('MIT')
depends=('python' 'python-graphql-core'	'python-dateutil' 'python-packaging'
         'python-cross-web' 'python-rich' 'python-typing_extensions' 'python-pygments')
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/strawberry-graphql/strawberry/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8758bba0a0e1054ec60d47e3b93bd4a46464b700008248e57fe5212ac5095139')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

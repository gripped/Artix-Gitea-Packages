# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=4.5.0.4
pkgrel=1
pkgdesc="CLI curses-based monitoring tool"
url="https://nicolargo.github.io/glances"
arch=('any')
license=('LGPL-3.0-or-later')
depends=('python' 'python-psutil' 'python-defusedxml' 'python-orjson' 'python-pydantic' 'python-packaging' 'python-jinja' 'python-shtab')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('hddtemp: HDD temperature monitoring support'
            'uvicorn: for WebUI / RestFull API'
            'python-fastapi: for WebUI / RestFull API'
            'python-docker: for the Docker monitoring support'
            'python-matplotlib: for graphical/chart support'
            'python-netifaces2: for the IP plugin'
            'python-zeroconf: for the autodiscover mode'
            'python-pystache: templating engine'
            'python-prometheus_client: for the Prometheus export module')
backup=("etc/${pkgname}/${pkgname}.conf")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nicolargo/glances/archive/v${pkgver}.tar.gz"
        'disable_update_check.patch')
sha512sums=('070becfbb0c37c925a67b8433ec989eac46f94bd9d2783103c76048c8cec041081d2289a4eb58b4444cff82399fd6023d284dde0056bfcef51b54dfa76e004aa'
            'debe0bdd62fae124d17e559476327db22f916e5f0b3186b0ba0bc6254437617285b455ead961edb5c9654d42236db56c302a0c750dce4a8446611b8a3fe2c175')
b2sums=('737e39ac2049bfa3acd4f7eac1b03af7944da7e6d9e667d1992c542b0fa9615c57546a6511bc24025845eb04e67f089824515111e031f9fb2870aef1cb92cd11'
        '574d49f96729e698de77868d74812f0efd9861043f25a8f473431440654481f60fcce9f1c457f1900651b157d94f67835c67b548a4bc1957c9123d41e0a9b0a1')

prepare() {
	cd "${pkgname}-${pkgver}"
	# Disable default update check in the config file
	patch -Np1 -i "${srcdir}/disable_update_check.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 "conf/${pkgname}.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}

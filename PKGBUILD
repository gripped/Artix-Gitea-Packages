# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=4.5.0.5
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
sha512sums=('33c508679b1531e70adc6f221045dad22b8f540e71aa7ab31ab75f977df2b5d2eb082d843655dec17f25ab70b62892c560780c54697f46835c5dd89f50f8b1f1'
            'debe0bdd62fae124d17e559476327db22f916e5f0b3186b0ba0bc6254437617285b455ead961edb5c9654d42236db56c302a0c750dce4a8446611b8a3fe2c175')
b2sums=('785d96e22dba4ba6e7d4ca2c59a2e8589d4728ac37994ccd12f6dc5e3cdac8a5d51cfb9ae3dd33754cf8228b2321aec1195b6b53555d725c061d62c28633a09d'
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

# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=4.5.2
pkgrel=2
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
backup=("etc/${pkgname}/${pkgname}.conf"
        "etc/conf.d/${pkgname}")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nicolargo/glances/archive/v${pkgver}.tar.gz"
        'disable_update_check.patch')
sha512sums=('3b2dd49fa0e2ba489aa96588eb742317b54c7e4df7d846282d7f61237fd4a6659d731387fb93ca0bf03e08bcafebd5a0f3bfbcdde155301386e62cc5250311ef'
            'debe0bdd62fae124d17e559476327db22f916e5f0b3186b0ba0bc6254437617285b455ead961edb5c9654d42236db56c302a0c750dce4a8446611b8a3fe2c175')
b2sums=('41154c56402758a006492ab523a9aff96c3817439df24518a857fa37bd1bac67a10b80238ea47fb6e031fda241ceea47175caaaccbc7cc143ae251289b163f80'
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

# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=4.4.1
pkgrel=3
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
sha512sums=('44a0def4d9454d36652eddf1edb2751855b03993ad5ba90ac461fff4c060dc088bbfaf8e9ff23d29a995ad67b35e0b45f9aaa65e9a789ed2846423d1d6af66ea'
            'debe0bdd62fae124d17e559476327db22f916e5f0b3186b0ba0bc6254437617285b455ead961edb5c9654d42236db56c302a0c750dce4a8446611b8a3fe2c175')
b2sums=('fb233f5297f5e58fd845e93d40c2bbefad5f3905becaeca077d8dc6fdfb9956b38d6ace3363334ca6df2ce37f3e6c1f6ab14b0c1ecd342701a811ee8bdc113ac'
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

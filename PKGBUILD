# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=4.5.3
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
backup=("etc/${pkgname}/${pkgname}.conf"
        "etc/conf.d/${pkgname}")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nicolargo/glances/archive/v${pkgver}.tar.gz"
        "${pkgname}-env.conf"
        'disable_update_check.patch')
sha512sums=('ceeea907d3d12bef692edeff4e1c3a0025e98a3e774f83a32568ff3f87af365504ada1450ab60be934ca807656701273650824b279bb8960041fb6c8d22e4f25'
            '05f1a7dfb293fd52eabdc877950fed01c8407d84f4c4959f292c4b91e653dd86b4a7d3145c3b2e237920f8fd3d5e05bbc0999d95aa72b56e083a55cf3e72b913'
            'debe0bdd62fae124d17e559476327db22f916e5f0b3186b0ba0bc6254437617285b455ead961edb5c9654d42236db56c302a0c750dce4a8446611b8a3fe2c175')
b2sums=('ac8c3f9f627aefafc5a3ecf2e696b0ecc27a8a51fa7722b8b2e85e11ae49eab69202bd2e0863491e4b49aa4d8e7cbbac7f41c90743239dc1dc56edd98d2bbadc'
        'e1218752e5ed8e3d42a5f9b7a1497839bb7f8666f45c4caf4fa8307666f0ee1c3f5c5213377421bfa18160ea0eb4ff3a3469c3501b4b56f00843be7adffac93e'
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
	install -Dm 644 "${srcdir}/${pkgname}-env.conf" "${pkgdir}/etc/conf.d/${pkgname}"
}

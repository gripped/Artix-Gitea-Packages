# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=4.0.7
pkgrel=1
pkgdesc='CLI curses-based monitoring tool'
arch=('any')
url='https://nicolargo.github.io/glances/'
license=('LGPL-3.0-or-later')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-psutil' 'python-future' 'python-defusedxml' 'python-ujson' 'python-pydantic' 'python-packaging')
optdepends=('hddtemp: HDD temperature monitoring support'
            'uvicorn: for WebUI / RestFull API'
            'python-jinja: for WebUI / RestFull API'
            'python-fastapi: for WebUI / RestFull API'
            'python-docker: for the Docker monitoring support'
            'python-matplotlib: for graphical/chart support'
            'python-netifaces: for the IP plugin'
            'python-zeroconf: for the autodiscover mode'
            'python-pystache: templating engine'
            'python-prometheus_client: for the Prometheus export module')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/nicolargo/glances/archive/v${pkgver}.tar.gz")
sha512sums=('bbd943a0897e58b89709a8e77ab7b3deb27a0dc0e7325c3bd3480885b8e8956658d459d50bf22ceb4be4bd0ff888152f0c12d83e3851532206fe7cb5ae26d998')
b2sums=('5b5ff7aa349813a4e0669ff23c286ce7e65ff9b3987d445bd1b298295e12c847e5a9b08c4c59c1956c952f86b8c1a39e4a8799b6beb8cef42e5887a385809f30')

build() {
  cd "glances-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "glances-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

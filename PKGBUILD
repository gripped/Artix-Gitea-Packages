# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=4.0.1
pkgrel=1
pkgdesc='CLI curses-based monitoring tool'
arch=('any')
url='https://nicolargo.github.io/glances/'
license=('LGPL-3.0-or-later')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-psutil' 'python-future' 'python-defusedxml' 'python-ujson')
optdepends=('hddtemp: HDD temperature monitoring support'
            'uvicorn: for WebUI / RestFull API'
            'python-fastapi: for WebUI / RestFull API'
            'python-docker: for the Docker monitoring support'
            'python-matplotlib: for graphical/chart support'
            'python-netifaces: for the IP plugin'
            'python-zeroconf: for the autodiscover mode'
            'python-pystache: templating engine'
            'python-prometheus_client: for the Prometheus export module')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/nicolargo/glances/archive/v${pkgver}.tar.gz")
sha512sums=('ed8700fef142af170212c4c92bc9c2c818db94de41ad5eb35cc377a5bb067c6950908d2caac348ad9357f0ca6494fe011310b09147f37f86a9ae40355fbf6a75')
b2sums=('24d0ba707ba16b6b2944a87485b3a052360162b4ff9f42c22b2f74c5d7fbf46daad5ba2ad4203f1ecb157399c66fea27e4ad3b2b52179b6a688d1667c947421b')

build() {
  cd "glances-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "glances-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

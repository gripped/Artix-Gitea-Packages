# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=4.0.0
pkgrel=1
pkgdesc='CLI curses-based monitoring tool'
arch=('any')
url='https://nicolargo.github.io/glances/'
license=('LGPL-3.0-or-later')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-psutil' 'python-future' 'python-defusedxml' 'python-ujson')
optdepends=('hddtemp: HDD temperature monitoring support'
            'python-bottle: web server support'
            'python-docker: for the Docker monitoring support'
            'python-matplotlib: for graphical/chart support'
            'python-netifaces: for the IP plugin'
            'python-zeroconf: for the autodiscover mode'
            'python-pystache: templating engine'
            'python-prometheus_client: for the Prometheus export module')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/nicolargo/glances/archive/v${pkgver}.tar.gz")
sha512sums=('8c162299ad0bdd2e5318bedf221159b5fc858a08f697c05daa7bafb8338fa7508fc1ec28934918823c0d281bc6496069cf2f415fda79a4f58e3a586dc0b9656c') 
b2sums=('68b99edde07c4dce8886cf906371e4d61fa01317c2276f99994eb49682a66a4a758e6331717ff91e10e3c36a9a7f7f205704657d44af4a9b0dc54e6239888c09')

build() {
  cd "glances-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "glances-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

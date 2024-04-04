# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=3.4.0.5
pkgrel=3
pkgdesc='CLI curses-based monitoring tool'
arch=('any')
url='https://nicolargo.github.io/glances/'
license=('LGPL-3.0-or-later')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-psutil' 'python-future' 'python-defusedxml' 'python-ujson' 'python-packaging')
optdepends=('hddtemp: HDD temperature monitoring support'
            'python-bottle: web server support'
            'python-docker: for the Docker monitoring support'
            'python-matplotlib: for graphical/chart support'
            'python-netifaces: for the IP plugin'
            'python-zeroconf: for the autodiscover mode'
            'python-pystache: templating engine'
            'python-prometheus_client: for the Prometheus export module')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/nicolargo/glances/archive/v${pkgver}.tar.gz")
sha512sums=('aca140fedc2acc97ae4901722e0406acb8bea6eac5295d95499860a522e74d29ecbc4cfb28fecfd4a2879f4ee44175bd4efd2429b9d7e302b4a182caabd6a5f8')
b2sums=('510f379946eec914998cba32ffd66c6037bd85246cdae059d336b4a3330ba6e521aa3fef2099d88f08dbf3ed7e7c8537235850ad8f6882840fb811bcd8a82147')

build() {
  cd "glances-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "glances-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

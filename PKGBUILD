# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=4.1.1
pkgrel=1
pkgdesc='CLI curses-based monitoring tool'
arch=('any')
url='https://nicolargo.github.io/glances/'
license=('LGPL-3.0-or-later')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-psutil' 'python-future' 'python-defusedxml' 'python-orjson' 'python-pydantic' 'python-packaging')
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
sha512sums=('4573b3046a34b539f84f2b9e8190a2f6fea8c214cfb8ac6197ee0e8c4e1bd29483a5551897624861de1bd359f609127e612c53b7eb0291db9d1be55af3cfad56')
b2sums=('09d9f558979fbdb785190247d3a9b50ec331d6e06dc23441a23965d818a97d10327c0944315a5ced19f707a179da83835c60fd15ff6d9163edb57f2222d92741')

build() {
  cd "glances-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "glances-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

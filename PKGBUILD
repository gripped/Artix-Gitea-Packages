# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-aiohttp-openmetrics
_name=${pkgname#python-}
pkgver=0.0.12
pkgrel=1
pkgdesc='OpenMetrics provider for aiohttp'
arch=('any')
url=https://github.com/jelmer/aiohttp-openmetrics
license=('Apache')
depends=('python-aiohttp' 'python-prometheus_client')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('SKIP')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

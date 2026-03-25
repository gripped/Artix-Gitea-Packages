# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: pumpkin <pumpkin at mailoo dot org>
# Contributor: Vsevolod Balashov <vsevolod at balashov dot name>

pkgname=gunicorn
pkgver=25.2.0
pkgrel=1
pkgdesc='WSGI HTTP Server for UNIX'
arch=('any')
url='https://gunicorn.org/'
license=('MIT')
depends=('python-packaging')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-eventlet'
  'python-gevent'
  'python-h2'
  'python-httpx'
  'python-pytest'
  'python-pytest-asyncio'
)
optdepends=(
  'python-eventlet: for asynchronous request handling with eventlet'
  'python-gevent: for asynchronous request handling with gevent'
  'python-h2: for HTTP/2 support'
  'python-setproctitle: for process renaming'
  'python-tornado: for asynchronous request handling with tornado'
)
source=("git+https://github.com/benoitc/$pkgname.git#tag=$pkgver")
b2sums=('e28f3324c13a9b0f3c53e928aeb4f0d79de608085d6da178e64229a7d9ad967b40990f35c6157fe3ef9d06d03acc0fba3232f9614cfb19b7d6a0061fc003c48c')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  # Override addopts as they invoke coverage testing
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v --override-ini="addopts=" tests/test_signal_integration.py
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$pkgname-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

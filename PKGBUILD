# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=httpbin
pkgver=0.10.0
pkgrel=1
pkgdesc="HTTP Request and Response Service"
arch=('any')
url="https://github.com/psf/httpbin"
license=('MIT' 'custom:ISC')
depends=('python' 'python-flask' 'python-decorator' 'python-six'
         'python-brotlicffi' 'python-werkzeug' 'python-flasgger'
         # Not directly used. Will be removed in the next upstream version.
         'python-markupsafe' 'python-itsdangerous' 'python-gevent' 'python-jinja')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/psf/httpbin/archive/v$pkgver.tar.gz")
sha512sums=('99ff53dae27eb7e50a747cbfcef8381d974f62f79a319fdcda3446fb23bec4e4fea04f7b8e2bac26cfd3b49b229db9659b17166814cdfbbe8b1f2481155b8117')

build() {
  cd httpbin-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd httpbin-$pkgver
  pytest tests
}

package() {
  cd httpbin-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

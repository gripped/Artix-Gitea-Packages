# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-txredisapi
pkgver=1.5.0
pkgrel=1

pkgdesc='Non-blocking redis client for python'
url='https://pypi.python.org/pypi/txredisapi/'
arch=('any')
license=('Apache-2.0')

depends=('python' 'python-twisted')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=("https://pypi.org/packages/source/t/txredisapi/txredisapi-$pkgver.tar.gz")

sha256sums=('6ce8be7f98a3ae347769256b29980da42d3560637206d31682586d78cb9a9570')

build() {
	cd "$srcdir"/txredisapi-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd txredisapi-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 tw=0 ft=PKGBUILD :

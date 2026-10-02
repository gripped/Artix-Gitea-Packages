# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-txredisapi
pkgver=1.4.12
pkgrel=1

pkgdesc='Non-blocking redis client for python'
url='https://pypi.python.org/pypi/txredisapi/'
arch=('any')
license=('Apache')

depends=('python' 'python-twisted' 'python-six')
makedepends=('python-setuptools')

source=("https://pypi.org/packages/source/t/txredisapi/txredisapi-$pkgver.tar.gz")

sha256sums=('98e2440ff2e297c9048c5f9d516e7b1302d447cd9cd4568c986c35a8523de3c7')

build() {
	cd "$srcdir"/txredisapi-$pkgver
	python setup.py build
}

package() {
	cd txredisapi-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=PKGBUILD :

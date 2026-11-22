# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python-frozendict
pkgver=2.5.1
pkgrel=1
epoch=1
pkgdesc='An immutable dictionary'
url='https://pypi.python.org/pypi/frozendict/'
arch=('any')
license=('LGPL-3.0-only')
depends=('python')
optdepends=('python-orjson: monkeypatch support for orjson serialization')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://pypi.org/packages/source/f/frozendict/frozendict-$pkgver.tar.gz")
sha512sums=('9141565ca89f15dfd78316261d31f017e495b32b09472d8a9900c739e9426ad0085872245fa8581b71866443bf759562945d215eed9d636a13ff9560731f61bc')
b2sums=('795452a2eca654fbf1721f10682403bc007873494b7a1d381cbc201cc8a97e6977357d81f579581687def5579925b9a7a3196924db71902afe5de2f0679a54b4')

build() {
	cd frozendict-$pkgver
	python -m build --wheel --no-isolation
}

check(){
	cd frozendict-$pkgver
	python -m installer --destdir=test_dir dist/*.whl
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	PYTHONPATH="$PWD/test_dir$site_packages" pytest
}

package() {
	cd frozendict-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 tw=0 ft=PKGBUILD :

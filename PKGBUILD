# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=backports_zstd
pkgname=python-${_pyname//_/-}
pkgver=1.3.0
pkgrel=1.1
pkgdesc="Backport of compression.zstd"
arch=(x86_64 armv7h aarch64 i686)
url="https://github.com/rogdham/${_pyname//_/.}"
license=(PSF-2.0)
depends=(python
         zstd libzstd.so)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('e8b2d68e2812f5c9970cabc5e21da8b409b5ed04e79b4585dbffa33e9b45ebe2')

build() {
	cd "$_archive"
	python -m build -wn --config-setting=--build-option=--system-zstd
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

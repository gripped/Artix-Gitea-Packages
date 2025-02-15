# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org> 
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_devendored=1  # set to 0 to use vendored sources
_pkgname=poetry-core
pkgname=python-poetry-core
pkgver=2.1.0
pkgrel=1
pkgdesc='Poetry PEP 517 Build Backend & Core Utilities'
arch=(any)
url="https://github.com/python-poetry/${_pkgname}"
license=(MIT)
groups=(python-build-backend)
_pydeps=(fastjsonschema
         lark-parser
         packaging)
depends=(python)
if (( _devendored == 1 )); then
	depends+=("${_pydeps[@]/#/python-}")
fi
makedepends=(python-{build,installer})
checkdepends=(git
              python-pytest
              python-pytest-mock
              python-setuptools
              python-tomli-w
              python-trove-classifiers
              python-virtualenv)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz"
        "$pkgname-1.9.0-devendor.patch")
sha256sums=('baf30d0c0e301c288ff3a4a91d5ad107c4c04ba02f1f586d811f8e0a50f3c05b'
            'bc026f11bd8319cf9d3670355bf55d4ed6f074577a9acb97f287b4bb64d0b964')

prepare() {
	if (( _devendored == 1 )); then
		patch -Np1 -d "$_archive" -i "../$pkgname-1.9.0-devendor.patch"
		rm -rv "$_archive/src/poetry/core/_vendor"
	fi
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/src"
	# only works inside git repositories
	pytest \
		-k 'not test_default_with_excluded_data and not test_default_src_with_excluded_data'
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# Maintainer: Mark Wagie <mark at proton dot me>
pkgname=python-libsass
_name=${pkgname#python-}
pkgver=0.23.0
pkgrel=2
pkgdesc="Sass for Python: A straightforward binding of libsass for Python."
arch=('x86_64')
url="https://sass.github.io/libsass-python/"
license=('MIT')
depends=('libsass' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$_name-$pkgver.tar.gz::https://github.com/sass/libsass-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4bff7819756f52f6e4592f03f205104d1ca431088d9452aed5042f89a36f9873')

build() {
  cd "$_name-python-$pkgver"
  export SYSTEM_SASS="1"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-python-$pkgver"
  export SYSTEM_SASS="1"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm "${pkgdir}${site_packages}/sasstests.py" \
    "${pkgdir}${site_packages}"/__pycache__/sasstests.*.pyc
}


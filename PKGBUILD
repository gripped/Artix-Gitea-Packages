# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cloudflare
pkgver=2.19.2
pkgrel=1
pkgdesc='Python wrapper for the Cloudflare v4 API'
arch=('any')
license=('MIT')
url='https://github.com/cloudflare/python-cloudflare'
depends=(
  'python-jsonlines'
  'python-requests'
  'python-yaml'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("git+https://github.com/cloudflare/python-cloudflare.git#tag=$pkgver")
sha512sums=('9b0ebe715f876951858999c05957581081ca6f3af5e18dc2f9b7789dfc347a18c4e1b6a03803111e306637fee8d2d3e83c6cb9b671db17584d08d445c6351ae7')

build() {
  cd python-cloudflare
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd python-cloudflare
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="test_dir$site_packages:$PYTHONPATH" pytest CloudFlare/tests/test_cloudflare.py
}

package() {
  cd python-cloudflare
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir$site_packages"/examples
}

# vim:set ts=2 sw=2 et:

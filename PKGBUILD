# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-plette
pkgver=2.3.1
pkgrel=1
pkgdesc="Structured Pipfile and Pipfile.lock models"
url="https://github.com/sarugaku/plette"
license=('ISC')
arch=('any')
depends=('python-tomlkit')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/sarugaku/plette.git#tag=v$pkgver")
sha512sums=('78c5c2c706a017cef5dbec1db12ddd799c6f35c26375307adc1758f0f0f80f2f2a97116886831f5ad24c625148b92a54e402b3e965f0ac2312e3df03d52544a0')

build() {
  cd plette
  python -m build -nw
}

check() {
  cd plette
  python -m venv .venv --system-site-packages
  .venv/bin/python -m installer dist/*.whl
  .venv/bin/python -m pytest
}

package() {
  cd plette
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-html5tagger
pkgver=1.3.1
pkgrel=1
pkgdesc='Pythonic HTML generation/templating (no template files)'
arch=("any")
url='https://github.com/sanic-org/html5tagger'
license=(MIT)
depends=(python)
makedepends=(git python-build python-installer python-setuptools python-setuptools-scm python-wheel)
source=("git+https://github.com/sanic-org/html5tagger#tag=v$pkgver")
sha256sums=('868da5a0c226c47d9d519fab6158a75ca047016344f2d91e2a58819c9a18fbbf')

build() {
    cd html5tagger
    python -m build --wheel --no-isolation
}

package() {
    cd html5tagger
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

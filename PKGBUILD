# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-objgraph
pkgver=3.6.1
pkgrel=1
pkgdesc="Draws Python object reference graphs with graphviz"
url="https://github.com/mgedmin/objgraph"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('graphviz')
source=("objgraph-$pkgver.tar.gz::https://github.com/mgedmin/objgraph/archive/$pkgver.tar.gz")
sha512sums=('619be7a56add7e1ddf3edce4d153bc3592af85c36d6ef03c443a5150f35cce593eac3e50cb98384c2834059594e12fa2a236a89ee3dd0dd4ef385932bfb1da2f')

build() {
  cd objgraph-$pkgver
  python setup.py build
}

check() {
  cd objgraph-$pkgver
  python setup.py test
}

package() {
  cd objgraph-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

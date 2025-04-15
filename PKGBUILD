# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: alphazo <alphazo@gmail.com>

pkgname=sshuttle
pkgver=1.3.0
pkgrel=1
pkgdesc='Transparent proxy server that forwards all TCP packets over ssh'
arch=('any')
url="https://github.com/sshuttle/sshuttle"
license=('GPL2')
depends=('iptables' 'openssh' 'net-tools')
makedepends=('git' 'python-sphinx' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
backup=('etc/sshuttle/tunnel.conf' 'etc/sshuttle/prefixes.conf')
source=("git+https://github.com/sshuttle/sshuttle.git#tag=v$pkgver")
sha512sums=('a14ecd12b99ac2945485bd66e41cfd08c9ff2beb9c22176599ec7394c83cefbe80205acec5933ee623a7db781b7cadef32c5f07c9b980738944e87069e5745e5')

prepare() {
  cd sshuttle
  sed -i '/--cov/d' setup.cfg
}

build() {
  cd sshuttle
  python -m build -nw

  cd docs
  make man
}

check() {
  cd sshuttle
  PYTHONPATH="$PWD" pytest
}

package() {
  cd sshuttle
  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm644 docs/_build/man/sshuttle.1 "$pkgdir"/usr/share/man/man1/sshuttle.1

  install -d "$pkgdir"/etc/sshuttle
  install -m644 "$srcdir"/{tunnel.conf,prefixes.conf} "$pkgdir"/etc/sshuttle
}

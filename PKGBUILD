# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: alphazo <alphazo@gmail.com>

pkgname=sshuttle
pkgver=1.3.2
pkgrel=2
pkgdesc='Transparent proxy server that forwards all TCP packets over ssh'
arch=('any')
url="https://github.com/sshuttle/sshuttle"
license=('LGPL-2.1-or-later')
depends=('iptables' 'openssh' 'net-tools')
makedepends=('git' 'python-sphinx' 'python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
backup=('etc/sshuttle/tunnel.conf' 'etc/sshuttle/prefixes.conf')
source=("git+https://github.com/sshuttle/sshuttle.git#tag=v$pkgver")
sha512sums=('f90277c86b153b0a0ec2b584784d8f63abd61810ea5bbce48f17a270d58a66351b7a21df62b05ae08cd337d14d46ef11b7a4bff34bf8660001add5eb731bfc27')

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

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
source=("git+https://github.com/sshuttle/sshuttle.git#tag=v$pkgver"
        'prefixes.conf' 'tunnel.conf')

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
sha256sums=('e7152302cda6f134f9a30e9042a1d3d2d94ed430b4ce4aae3c9bc8ae05870616'
            '70b1e64b8cfd335355f156e141378887bcb5a6a2d9f1eb84e5b81853bcfbfc68'
            '72ce201e53b575a2d68c44ae7c5fec8d5d134036c63f59fcded3977b375a05e2')

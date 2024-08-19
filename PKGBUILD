# Maintainer: artist for Artix Linux

pkgname=epour
pkgver=0.7.0
pkgrel=2
pkgdesc="EFL Bittorrent client"
arch=('x86_64')
url="https://www.enlightenment.org/"
license=('BSD')
depends=('efl')
makedepends=('git' 'python-distutils-extra')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-git")
source=("git+https://git.enlightenment.org/enlightenment/epour.git"
        "setup-py.patch")
sha256sums=('SKIP'
            '8f8e286707705589ff1c81c145cc949ef0c71fd259d566ea9d43842374d73fa1')

prepare() {
  cd $pkgname
  patch -Np1 -i ../setup-py.patch
}

package() {
  cd $pkgname

  python setup.py install --prefix=/usr --root="$pkgdir"  #--optimize=1 if this active epour doesn't show icons

# install text files
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" README TODO

# install license files
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}

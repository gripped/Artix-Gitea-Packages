# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Jacob Moody <moody@posixcafe.org>
pkgname=s6-networking
pkgver=2.7.0.0
pkgrel=1
pkgdesc="A suite of small networking tools for UNIX systems."
arch=('x86_64')
url="https://skarnet.org/software/s6-networking/"
license=('ISC')
depends=('s6' 's6-dns' 'bearssl' 'libs6.so' 'libs6dns.so')
provides=('libs6net.so')
source=("https://skarnet.org/software/s6-networking/${pkgname}-${pkgver}.tar.gz")
sha256sums=('99fd6e3f93d6d6a95bf7e978955b7d053629591794b068eda2004ab8b4905552')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc \
              --enable-ssl=bearssl \
              --enable-shared \
              --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 

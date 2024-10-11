# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Jacob Moody <moody@posixcafe.org>
pkgname=s6-networking
pkgver=2.7.0.4
pkgrel=1
pkgdesc="A suite of small networking tools for UNIX systems."
arch=('x86_64')
url="https://skarnet.org/software/s6-networking/"
license=('ISC')
depends=('s6' 's6-dns' 'bearssl' 'libs6.so' 'libs6dns.so')
provides=('libs6net.so')
source=("https://skarnet.org/software/s6-networking/${pkgname}-${pkgver}.tar.gz")
sha256sums=('31bdb70c824f58f6cb09d0a568a2454615eeaf498a82896f6c3f8382af590965')

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

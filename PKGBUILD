# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Mantas M. <grawity@gmail.com>

pkgname="nss-myhostname"
pkgver=0.3
pkgrel=6
pkgdesc="NSS plugin providing host name resolution for the locally configured system hostname"
arch=(x86_64)
url="http://0pointer.de/lennart/projects/nss-myhostname/"
license=('LGPL-2.1-only')
depends=('glibc')
source=("http://0pointer.de/lennart/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-lynx
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=iproute2
pkgver=6.6.0
pkgrel=1
pkgdesc='IP Routing Utilities'
arch=('x86_64')
license=('GPL2')
url='https://git.kernel.org/pub/scm/network/iproute2/iproute2.git'
depends=('glibc' 'iptables' 'libcap' 'libelf' 'libbpf')
makedepends=('db5.3')
optdepends=('db5.3: userspace arp daemon'
            'linux-atm: ATM support'
            'python: for routel')
provides=('iproute')
makedepends=('linux-atm')
options=('staticlibs')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=("https://www.kernel.org/pub/linux/utils/net/${pkgname}/${pkgname}-v${pkgver}.tar."{xz,sign}
        '0001-make-iproute2-fhs-compliant.patch'
        '0002-bdb-5-3.patch')
sha256sums=('77e49171a58ae1a507d890f76336a0b4704bb5057be5bb9b4d721c4b1d199d56'
            'SKIP'
            '758b82bd61ed7512d215efafd5fab5ae7a28fbfa6161b85e2ce7373285e56a5d'
            '611c1ad7946aab226a5f4059922d9430f51b3377e33911427f8fdf7f7d31f7d6')

prepare() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}"/0001-make-iproute2-fhs-compliant.patch

  # use Berkeley DB 5.3
  patch -Np1 -i "${srcdir}"/0002-bdb-5-3.patch

  # do not treat warnings as errors
  sed -i 's/-Werror//' Makefile

}

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  export CFLAGS+=' -ffat-lto-objects'

  ./configure
  make DBM_INCLUDE='/usr/include/db5.3'
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install

  # libnetlink isn't installed, install it FS#19385
  install -Dm0644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm0644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"
}

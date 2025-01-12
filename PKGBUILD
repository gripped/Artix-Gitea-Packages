# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Pedro Martinez-Julia (pedromj@um.es)
# Contributor: Matt Monaco <net 0x01b dgbaley27>

pkgname=openvswitch
pkgver=3.4.1
pkgrel=1
pkgdesc="Production Quality, Multilayer Open Virtual Switch"
url="http://openvswitch.org"
license=('Apache-2.0')
arch=(x86_64)
install=openvswitch.install
source=("http://openvswitch.org/releases/openvswitch-$pkgver.tar.gz"
	    openvswitch.tmpfiles)
depends=('openssl' 'libcap-ng' 'dpdk')
makedepends=('python')
sha256sums=('6e97ec7dfdda5b40b5103946d53e4f8b11edf66049fedbdcb323e1af67133de8'
            'e8dc21e50fc886bfd6aa55991bdb3cb66907e11b071045452bb12de01a3ecbd9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i \
    -e 's|$(sysconfdir)/bash_completion.d|/usr/share/bash-completion/completions|g' \
    -e '/if grep warning:/d' \
    Makefile.am
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./boot.sh
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-rundir=/run/openvswitch \
    --sbindir=/usr/bin \
    PYTHON=/usr/bin/python3
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 "$srcdir"/openvswitch.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/openvswitch.conf"
  install -dm0755 "$pkgdir/etc/openvswitch"
  rm -rf "$pkgdir"/run
}

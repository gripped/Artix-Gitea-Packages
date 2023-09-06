# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Pedro Martinez-Julia (pedromj@um.es)
# Contributor: Matt Monaco <net 0x01b dgbaley27>

pkgname=openvswitch
pkgver=3.1.1
pkgrel=1
pkgdesc="Production Quality, Multilayer Open Virtual Switch"
url="http://openvswitch.org"
license=('APACHE')
arch=(x86_64)
install=openvswitch.install
source=("http://openvswitch.org/releases/openvswitch-$pkgver.tar.gz"
	font_cw.patch::https://patch-diff.githubusercontent.com/raw/openvswitch/ovs/pull/416.patch
	0001-disable-manpage-check.patch
	openvswitch.tmpfiles)
depends=('openssl' 'libcap-ng')
makedepends=('python-six' 'groff')
optdepends=('python-six')
sha256sums=('60489183a44d3b95a55224072217c5f6d37aa11be12a75762510cedb93a4e204'
            '6edd7371675d8ed26ccaa6c80fbd248398193307f0151c2233cc267fc5b9793c'
            'f78ca38a40cf1cdca48980689988d8271be79b86e932263993a9498b19ec896b'
            'e8dc21e50fc886bfd6aa55991bdb3cb66907e11b071045452bb12de01a3ecbd9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../font_cw.patch
  patch -Np1 -i ../0001-disable-manpage-check.patch

  sed -i \
    -e 's|$(sysconfdir)/bash_completion.d|/usr/share/bash-completion/completions|g' \
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
    PYTHON=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 "$srcdir"/openvswitch.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/openvswitch.conf"
  install -dm0755 "$pkgdir/etc/openvswitch"
  rm -rf "$pkgdir"/run
}

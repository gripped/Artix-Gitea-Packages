# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=rpcbind
pkgver=1.2.9
pkgrel=1
pkgdesc="portmap replacement which supports RPC over various protocols"
arch=(x86_64)
url="http://rpcbind.sourceforge.net"
license=('BSD-3-Clause')
backup=('etc/conf.d/rpcbind')
depends=('glibc' 'libtirpc' 'libudev')
makedepends=('udev')
replaces=('portmap')
# see also http://git.linux-nfs.org/?p=steved/rpcbind.git;a=summary
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2
        rpcbind-sunrpc.patch
        tmpfiles.d
        sysusers.d)
sha1sums=('111058e312e0634f8bd23a783ea4f99912ced085'
          '1b997ce76f9727efc8c72fc5f97189591c9a60e2'
          'eb8b7375a4ca31b3f61fa726f387884d5e4ca7a3'
          'b81b2d3798fc88359aaa0f08b2d3c2f809a19fc1')
sha256sums=('ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b'
            '7a32111c74e708ad431b7114580c60d7405c591273e6cc00baf5baff05952573'
            '08b04f4da12b34d66cc8fefa0a6dcac239019b0de0090e08d61cb18cc36a6045'
            '392ee0af235f58b48bca068ea71a29aad912001e57d68184a03bf6c15bc2587e')

prepare() {
  cd $pkgname-$pkgver
  # patch for iana services file # FS#20273
  patch -Np1 -i ../rpcbind-sunrpc.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --with-systemdsystemunitdir=no --prefix=/usr --sbindir=/usr/bin \
    --with-rpcuser=rpc \
    --enable-warmstarts \
    --with-statedir=/var/lib/rpcbind \
    --enable-rmtcalls
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # install rpcbind config file
  # install -D -m644 "$srcdir"/rpcbind.conf "$pkgdir"/etc/conf.d/rpcbind
  # install missing man page - https://bugs.archlinux.org/task/21271
  install -m644 man/rpcinfo.8 "$pkgdir"/usr/share/man/man8/
  # systemd sysusers/tempfile
  install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/rpcbind.conf
  install -Dm644 ../sysusers.d "${pkgdir}"/usr/lib/sysusers.d/rpcbind.conf
  # install license
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/rpcbind/COPYING
}

# Maintainer: Sébastien "Seblu" Luttringer
# Contributor: Le_suisse <lesuisse.dev+aur at gmail dot com>
# Contributor: Jason Rodriguez <jason-aur@catloaf.net>

pkgname=sslh
pkgver=2.2.4
pkgrel=1
pkgdesc='SSL/SSH/OpenVPN/XMPP/tinc port multiplexer'
arch=('x86_64')
url='https://www.rutschle.net/tech/sslh/README.html'
license=('GPL-2.0-only')
makedepends=('git')
depends=('glibc' 'libcap' 'libconfig' 'pcre2' 'libev' 'libbsd')
backup=('etc/sslh.cfg')
install=$pkgname.install
source=("git+https://github.com/yrutschle/sslh.git#tag=v${pkgver}?signed"
        'sslh.cfg')
validpgpkeys=('CDDDBADBEA4B72748E007D326C056F7AC7934136') # Yves Rutschle <yves@rutschle.net>
sha256sums=('84eef4cc925523ea1cae6e5a1b0b7127ab4c63592900e185ced28a157062c290'
            '7db2e873ed4c8770e3c38d7ac3ced94221356a3ceafa9d6c8cdc65dd8f09a18e')

build() {
  cd $pkgname
  ./configure --prefix=/usr --bindir=/usr/bin
  make \
    VERSION=\"$pkgver-$pkgrel\" \
    USELIBCAP=1 \
    USELIBBSD=1 \
    all
}

package() {
  # default arch config
  install -Dm 644 sslh.cfg "$pkgdir/etc/sslh.cfg"
  # manually install to have both ssl-fork and ssl-select
  cd $pkgname
  install -Dm 755 sslh-fork "$pkgdir/usr/bin/sslh-fork"
  install -Dm 755 sslh-select "$pkgdir/usr/bin/sslh-select"
  install -Dm 755 sslh-ev "$pkgdir/usr/bin/sslh-ev"
  ln -s sslh-fork "$pkgdir/usr/bin/sslh"
  # install manpage
  install -Dm 644 sslh.8.gz "$pkgdir/usr/share/man/man8/sslh.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-fork.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-select.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-ev.8.gz"
  # install examples files
  install -Dm 644 basic.cfg "$pkgdir/usr/share/doc/$pkgname/basic.cfg"
  install -Dm 644 example.cfg "$pkgdir/usr/share/doc/$pkgname/example.cfg"
}

# vim:set ts=2 sw=2 et:

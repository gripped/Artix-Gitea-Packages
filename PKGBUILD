# Maintainer: Sébastien "Seblu" Luttringer
# Contributor: Le_suisse <lesuisse.dev+aur at gmail dot com>
# Contributor: Jason Rodriguez <jason-aur@catloaf.net>

pkgname=sslh
pkgver=2.1.2
pkgrel=1
pkgdesc='SSL/SSH/OpenVPN/XMPP/tinc port multiplexer'
arch=('x86_64')
url='https://www.rutschle.net/tech/sslh/README.html'
license=('GPL-2.0-only')
depends=('glibc' 'libcap' 'libconfig' 'pcre2' 'libev' 'libbsd')
backup=('etc/sslh.cfg')
install=$pkgname.install
source=("https://www.rutschle.net/tech/sslh/$pkgname-v$pkgver.tar.gz"{,.asc}
        'sslh.cfg')
validpgpkeys=('CDDDBADBEA4B72748E007D326C056F7AC7934136') # Yves Rutschle <yves@rutschle.net>
sha256sums=('dce8e1a77f48017b5164486084f000d9f20de2d54d293385aec18d606f9c61d9'
            'SKIP'
            '7db2e873ed4c8770e3c38d7ac3ced94221356a3ceafa9d6c8cdc65dd8f09a18e')

prepare() {
  cd $pkgname-v$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $pkgname-v$pkgver
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
  cd $pkgname-v$pkgver
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

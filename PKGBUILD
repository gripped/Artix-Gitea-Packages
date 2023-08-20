# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=vnstat
pkgver=2.11
pkgrel=1
pkgdesc="A console-based network traffic monitor"
arch=('x86_64')
url="https://humdi.net/vnstat/"
license=('GPL')
depends=('bash' 'sqlite')
makedepends=('gd')
optdepends=('gd: image output')
backup=(etc/vnstat.conf)
source=(https://humdi.net/vnstat/$pkgname-$pkgver.tar.gz
        vnstatd.tmpfile vnstatd.sysusers)
sha256sums=('babc3f1583cc40e4e8ffb2f53296d93d308cb5a5043e85054f6eaf7b4ae57856'
            '91c9577f36c7f7ec32bb2963035a6ac49e7556ac6adc41564c033db8889b669e'
            'b9c3af7c6e8dc42aa6be0b52988aba8d64646116c211a1d055a17262c1d32edf')
validpgpkeys=(23EF1DD76E65248FB055201ADAFE84E63D140114) # Teemu Toivola

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # Artix
  install -Dm644 "$srcdir"/vnstatd.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/vnstatd.conf
  install -Dm644 "$srcdir"/vnstatd.sysusers "$pkgdir"/usr/lib/sysusers.d/vnstatd.conf
  install -Dm0755 examples/vnstat.cgi -t "$pkgdir"/usr/share/doc/vnstat/examples
}

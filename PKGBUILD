# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=vnstat
pkgver=2.13
pkgrel=2
pkgdesc="A console-based network traffic monitor"
arch=('x86_64')
url="https://humdi.net/vnstat/"
license=('GPL')
depends=('bash' 'sqlite')
makedepends=('gd' 'git')
optdepends=('gd: image output')
backup=(etc/vnstat.conf)
source=(git+https://github.com/vergoh/vnstat.git#tag=v${pkgver}
vnstatd.tmpfile vnstatd.sysusers)
sha256sums=('ce4a9fee6bffc7960ba138991c68f5d8c0ad0bc375ed6f949f8d8c6e18b38335'
'91c9577f36c7f7ec32bb2963035a6ac49e7556ac6adc41564c033db8889b669e'
'b9c3af7c6e8dc42aa6be0b52988aba8d64646116c211a1d055a17262c1d32edf')
#validpgpkeys=(23EF1DD76E65248FB055201ADAFE84E63D140114) # Teemu Toivola

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm0755 examples/vnstat.cgi -t "$pkgdir"/usr/share/doc/vnstat/examples
  # Artix
  install -Dm644 "$srcdir"/vnstatd.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/vnstatd.conf
  install -Dm644 "$srcdir"/vnstatd.sysusers "$pkgdir"/usr/lib/sysusers.d/vnstatd.conf
}

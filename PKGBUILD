# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=perl-json-xs
pkgver=4.05
pkgrel=1
pkgdesc="JSON::XS - JSON serialising/deserialising, done correctly and fast"
url="https://search.cpan.org/dist/JSON-XS/"
license=("GPL")
arch=('x86_64')
depends=('perl' 'perl-common-sense' 'perl-types-serialiser')
makedepends=('perl-canary-stability')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/JSON-XS-$pkgver.tar.gz)
sha256sums=('87f08065667a175e8c484d89c51366c08c686609017a68d186fbcbe833f1f958')

build() {
  cd  "$srcdir"/JSON-XS-$pkgver
  PERL_CANARY_STABILITY_NOPROMPT=1 \
  perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd  "$srcdir"/JSON-XS-$pkgver
  make DESTDIR="$pkgdir" install

}

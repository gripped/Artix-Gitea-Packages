# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-dbi
pkgver=1.649
pkgrel=1
pkgdesc="Database independent interface for Perl"
arch=('x86_64')
url="https://metacpan.org/release/DBI"
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/DBI-$pkgver.tgz")
sha512sums=('71f2a1e2a36b5aa2a69adbbdcb6b985f6bd1f2c0953530ad0e957826f526ca5c48b858e1c59dc85f546b4aee0fa5dbe50469c06b55efcc4a63f784cdb8c59e13')

build() {
  cd DBI-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd DBI-$pkgver
  make test
}

package() {
  cd DBI-$pkgver
  make DESTDIR="$pkgdir" install
}

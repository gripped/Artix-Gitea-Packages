# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-ppi
pkgver=1.290
pkgrel=1
pkgdesc="Parse, Analyze and Manipulate Perl (without perl)"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
url="https://metacpan.org/release/PPI"
depends=('perl-clone' 'perl-params-util' 'perl-task-weaken' 'perl-safe-isa' 'perl-yaml-pp')
makedepends=('perl-class-inspector' 'perl-test-nowarnings' 'perl-test-object'
             'perl-test-subcalls')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MI/MITHALDU/PPI-$pkgver.tar.gz")
sha512sums=('e97bbfbcc74f379167bb23a3c4cc1b0acc7f7bdbaf97ebfe248d6314dd2d7b92daef73049ecfbde25f2c864a472f85129e14ae0be73c26c718ef7b074e4ff6d4')

build() {
  cd PPI-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd PPI-$pkgver
  make test
}

package() {
  cd PPI-$pkgver
  make DESTDIR="$pkgdir" install
}

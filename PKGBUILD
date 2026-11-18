# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>

pkgname=perl-business-isbn-data
pkgver=20261112.001
pkgrel=1
pkgdesc='Data pack for Business::ISBN'
arch=(any)
url='https://github.com/briandfoy/business-isbn-data'
license=(Artistic-2.0)
depends=(perl perl-business-isbn-data)
makedepends=(git)
checkdepends=(perl-test-pod)
optdepends=('perl-libwww: for access to the xISBN service')
options=(purge !emptydirs)
source=("$pkgname::git+$url#tag=release-${pkgver}")
sha512sums=('7714f001b3a3f88f6a61ca29d602de70928f4500658fcd8fc3c1bf2a698ea931087340647557643230ad5b2f94affdab0a7d89b3fed7d1e0409b266f0f9841f0')
b2sums=('f53ee08283dc17d229a5fb2deeb4dbb759053346c36a533fdd10b0a5d6e53b84232103d68633718852db43b1077a035a0c9b8ca034a03d1e54e99d0d1735a474')

build() {
  cd "$pkgname"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
}

check() {
  cd "$pkgname"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$pkgname"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=perl-xml-parser
pkgver=2.57
pkgrel=1
pkgdesc="Expat-based XML parser module for perl"
arch=('x86_64')
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
url="https://github.com/cpan-authors/XML-Parser"
depends=('perl-file-sharedir' 'perl-libwww' 'expat')
makedepends=('git' 'perl-file-sharedir-install' 'perl-devel-checklib')
options=('!emptydirs')
source=("git+https://github.com/cpan-authors/XML-Parser.git#tag=${pkgver}")
sha512sums=('6a9658d8b62bb0a4df0a0751d15d1b9ba036d14996491de6ca01eff03d40b2304fff03766cbcf31e98e4e443c560eea541475231314774b8e346f7c7d6c8ad07')

build() {
  cd XML-Parser
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd XML-Parser
  make test
}

package() {
  cd XML-Parser
  make DESTDIR="${pkgdir}" install
}

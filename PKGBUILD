# Maintainer: artist for Artix Linux

pkgname=po4a
pkgver=0.74
pkgrel=1.2
pkgdesc="Tools for helping translation of documentation"
arch=('any')
url="https://po4a.org/"
license=('GPL')
depends=('perl' 'gettext' 'perl-yaml-tiny' 'perl-unicode-linebreak')
makedepends=('perl-text-wrapi18n' 'perl-locale-gettext' 'perl-term-readkey'
             'perl-sgmls' 'perl-module-build' 'perl-pod-parser' 'docbook-xsl')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/mquinson/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('6e390eb7707501a86f2e648d78fddb0d211d1e8699aa1ee201176e9f966a798b')

build() {
  cd ${pkgname}-${pkgver}
  # The script expects a UTF-8 locale
  LC_ALL=en_US.UTF-8 perl Build.PL

  perl Build
}

package() {
  cd ${pkgname}-${pkgver}
  perl Build destdir="${pkgdir}" install
}


# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=m17n-db
pkgver=1.8.18
pkgrel=1
pkgdesc='Multilingual text processing library (database)'
url='https://www.nongnu.org/m17n/'
arch=('any')
license=('LGPL-2.1-or-later' 'GPL-2.0-or-later' 'MIT')
depends=('glibc') # not because of compiling, but because of /usr/share/i18n/charmaps/ files that glibc provides
makedepends=('git')
# Savannah's HTTPS endpoint returns 502 for Git smart HTTP; use the Git protocol.
source=("$pkgname::git+git://git.savannah.gnu.org/m17n/m17n-db.git#tag=REL-${pkgver//./-}")
sha256sums=('e2bb18138c378b2e1df8a95518d00eb5755b86a1c322f6c2400b8ade379089a7')

prepare() {
  cd "$pkgname"
  ./bootstrap.sh
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="${pkgdir}" install

# Drop script that makes UIM segfault http://savannah.nongnu.org/bugs/index.php?53202
  rm "$pkgdir"/usr/share/m17n/hu-rovas-post.mim
}

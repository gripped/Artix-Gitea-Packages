# Maintainer: artist for Artix Linux

pkgname=nl-ease
pkgver=0.0.1
pkgrel=1
#_gituser="thewaiter"
_gituser="diekrz2"
pkgdesc="A tool to easily set the night light"
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha')
makedepends=('git')
source=("${pkgname}-${pkgver}::git+https://github.com/${_gituser}/${pkgname}.git")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # install text files
  [[ -e README.md ]] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md" || true

  # install license files
  [[ -e LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || true
}


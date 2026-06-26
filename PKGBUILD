# Maintainer: artist for Artix Linux

pkgname=sysinfo
pkgver=0.0.1
pkgrel=1
#_gituser="diekrz2"
_gituser="BodhiDev"
pkgdesc="A simple yad based System Info application"
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha' 'yad')
makedepends=('intltool' 'git')
source=("${pkgname}-${pkgver}::git+https://github.com/${_gituser}/${pkgname}.git"
        undo-strip-modification.patch)
#options=(!strip)
sha256sums=('SKIP'
            'b3fd15bbfd8a36bcfe9be2b5fa6afd8c13f7968a6248d271e3369b88b8704ec6')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../undo-strip-modification.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  #install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  # install text files
  [[ -e README.md ]] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md" || true

  # install license files
  [[ -e LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || true
}


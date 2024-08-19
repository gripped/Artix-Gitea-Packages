# Maintainer: artist for Artix Linux

_module='photo'
pkgname="moksha-module-${_module}"
pkgver=0.1.1
pkgrel=3.1
pkgdesc="View photos or a mini slideshow within this gadget."
_group=('moksha-modules-extra')
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha')
makedepends=('git')
source=("${_group}::git+https://github.com/JeffHoogland/${_group}.git"
        "README")
sha256sums=('SKIP'
            '6069b18ff13bf9154c0cfc7e39f081ad40ab5c6acf506920eaa25d1951e1dfe5')

prepare() {
  cp README "${srcdir}/${_group}/modules/${_module}/"
}

build() {
    export LDFLAGS=-Wl,--allow-multiple-definition
    export CFLAGS="-mtune=generic -O2 -pipe -fno-plt -fexceptions \
           -Wp,-D_FORTIFY_SOURCE=2 -Wno-format -Wno-format-security  \
           -fstack-clash-protection -fcf-protection"
    cd "${srcdir}/${_group}/modules/${_module}"
    chmod +x autogen.sh
    if [[ -f configure ]]; then
      chmod +x configure
    fi
    ./autogen.sh \
      --prefix=/usr
    make
}

package() {

  cd "${srcdir}/${_group}/modules/${_module}"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}


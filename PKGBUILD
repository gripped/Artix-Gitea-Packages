# Maintainer: artist for Artix Linux

_module='productivity'
pkgname="moksha-module-${_module}"
pkgver=0.1.1
pkgrel=3.4
pkgdesc="Moksha module ${_module}"
_group=('moksha-modules-extra')
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha')
makedepends=('git')
source=("${_module}::git+https://github.com/rbtylee/emodule-${_module}.git")
sha256sums=('SKIP')

build() {
    export CFLAGS+=" -Wno-error=implicit-function-declaration"
    cd "${srcdir}/${_module}"
    chmod +x autogen.sh
    if [[ -f configure ]]; then
      chmod +x configure
    fi
    ./autogen.sh \
      --prefix=/usr
    make
}

package() {

  cd "${srcdir}/${_module}"
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


# Maintainer: artist for Artix Linux

_module='forecasts'
_fullmodule='forecast_e'
pkgname="moksha-module-${_module}"
pkgver=0.1.1
pkgrel=10
pkgdesc="The forecasts gadget will display the current weather conditions plus a few days forecast."
_group=('moksha-modules-extra')
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha')
makedepends=('git')
source=("${_fullmodule}::git+https://github.com/thewaiter/$_fullmodule.git#commit=8a3b0f8f7ebfb47663b24dc59960655f47af5993")
sha256sums=('6c2b7c4753055c036069133409aa3674b255df3e2d808e9b46dbb1f09fa84e78')

build() {
    cd "${srcdir}/${_fullmodule}"
    chmod +x autogen.sh
    if [[ -f configure ]]; then
      chmod +x configure
    fi
    ./autogen.sh \
      --prefix=/usr
    make
}

package() {

  cd "${srcdir}/${_fullmodule}"
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


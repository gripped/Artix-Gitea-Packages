# Maintainer: artist for Artix Linux

_module='compton'
pkgname="moksha-module-${_module}"
pkgver=0.1.1
pkgrel=7
pkgdesc="Moksha module for a compositor"
_group=('moksha-modules-extra')
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha')
#makedepends=('moksha-module-emprint' 'libbsd' 'git')
makedepends=('git' 'libpulse')
source=("${_module}::git+https://github.com/rbtylee/${_module}mod.git"
        picom-config-file-name.patch)
sha256sums=('SKIP'
            '9ee19834294c946df3a5903322d62853ea6bd0ff617d030755c0fc9d9d263017')

prepare() {
  cd "$srcdir"
  patch -Np1 -i "${srcdir}/picom-config-file-name.patch"
}

build() {
    export LDFLAGS=-Wl,--allow-multiple-definition
    export CFLAGS="-mtune=generic -O2 -pipe -fno-plt -fexceptions \
           -Wp,-D_FORTIFY_SOURCE=2 -Wno-format -Wno-format-security  \
           -fstack-clash-protection -fcf-protection"
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


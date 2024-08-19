# Maintainer: artist for Artix Linux

pkgname=moksha-theme-e17gtk
pkgver=0.2
_pkgname2=E17gtk
pkgrel=1.1
pkgdesc="Moksha E17gtk theme"
arch=('any')
url="https://github.com/thewaiter"
license=('BSD')
makedepends=('git')
source=("git+${url}/${_pkgname2}.git"
        "LICENSE")
sha256sums=('SKIP'
            'c7937410c48066984c66bd41f01066cda3429e03808868a48a1d8f6348a41f87')
options=("!strip")

package() {
  install -D -m644 ${srcdir}/$_pkgname2/README.md -t ${pkgdir}/usr/share/doc/$pkgname/README.md
  install -D -m644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -d -m755 ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2} ${pkgdir}/usr/share/themes/
}


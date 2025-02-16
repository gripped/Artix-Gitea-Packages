# Maintainer: artist for Artix Linux

pkgname=moksha-theme-viceversa
pkgver=0.1.4
_pkgname2=MokshaViceVersa
_pkgname3=bodhi-visa-versa
_pkgname4=bodhi-vice-versa
pkgrel=9
pkgdesc="Moksha Vice Versa theme"
arch=('any')
url="https://github.com/hippytaffer"
license=('BSD')
makedepends=('git' 'efl')
source=("git+${url}/${_pkgname3}.git"
        "LICENSE")
sha256sums=('SKIP'
            'c7937410c48066984c66bd41f01066cda3429e03808868a48a1d8f6348a41f87')
options=("!strip")

build() {
  cd "${srcdir}/${_pkgname3}/${_pkgname4}/"
  ./build.sh
}

package() {
  install -D -m644 ${srcdir}/$_pkgname3/README.md -t ${pkgdir}/usr/share/doc/$pkgname/README.md
  install -D -m644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ${srcdir}/${_pkgname3}/${_pkgname2}.edj -t "${pkgdir}/usr/share/enlightenment/data/themes/"
  install -d -m755 "${pkgdir}/usr/share/elementary/themes"
  cd "${pkgdir}/usr/share/elementary/themes"
  ln -s ../../enlightenment/data/themes/$_pkgname2.edj ./$_pkgname2.edj
  install -d -m755 ${pkgdir}/usr/share/icons
  install -d -m755 ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_pkgname3}/usr/share/icons ${pkgdir}/usr/share/icons/
  cp -r ${srcdir}/${_pkgname3}/${_pkgname2}-GTK ${pkgdir}/usr/share/themes/
}


# Maintainer: artist for Artix Linux

pkgname=moksha-theme-arc-green
pkgver=0.5.0
_pkgname2=enlightenment-arc-theme
_pkgname3=src
_pkgname4=arc-dark
_pkgname5=MokshaArcGreen
pkgrel=17
pkgdesc="Moksha Arc Green theme"
arch=('any')
url="https://github.com/thewaiter"
license=('BSD')
makedepends=('git' 'efl')
source=("git+${url}/${_pkgname2}.git")
sha256sums=('SKIP')
options=("!strip")

build() {
  cd "${srcdir}/${_pkgname2}"
  make -C $_pkgname3 ../$_pkgname4.edj
}

package() {
  install -D -m644 ${srcdir}/$_pkgname2/README.md -t ${pkgdir}/usr/share/doc/$pkgname/README.md
  install -D -m644 ${srcdir}/$_pkgname2/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ${srcdir}/${_pkgname2}/${_pkgname5}.edj -t "${pkgdir}/usr/share/enlightenment/data/themes/"
  install -d -m755 "${pkgdir}/usr/share/elementary/themes"
  cd "${pkgdir}/usr/share/elementary/themes"
  ln -s ../../enlightenment/data/themes/$_pkgname5.edj ./$_pkgname5.edj
  install -d -m755 ${pkgdir}/usr/share/icons
  install -d -m755 ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_pkgname2}/${_pkgname5}-Icons ${pkgdir}/usr/share/icons/
  cp -r ${srcdir}/${_pkgname2}/${_pkgname5}-GTK ${pkgdir}/usr/share/themes/
}

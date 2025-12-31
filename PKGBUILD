# Maintainer: artist for Artix Linux

pkgname=moksha-theme-dimensions
pkgver=0.0.1
_pkgname2=MokshaDimensions
_pkgname3=Vertex-Dark
_pkgname4=dimensions
pkgrel=14
pkgdesc="Moksha Dimensions theme"
arch=('any')
url="https://github.com/thewaiter"
license=('BSD')
makedepends=('git' 'efl')
source=("git+${url}/${_pkgname2}.git")
sha256sums=('SKIP')
options=("!strip")

build() {
  cd "${srcdir}/${_pkgname2}/${_pkgname4}/"
  ./build.sh
}

package() {
  install -D -m644 ${srcdir}/$_pkgname2/README.md -t ${pkgdir}/usr/share/doc/$pkgname/README.md
  install -D -m644 ${srcdir}/${_pkgname2}/${_pkgname2}.edj -t "${pkgdir}/usr/share/enlightenment/data/themes/"
  install -d -m755 "${pkgdir}/usr/share/elementary/themes"
  cd "${pkgdir}/usr/share/elementary/themes"
  ln -s ../../enlightenment/data/themes/$_pkgname2.edj ./$_pkgname2.edj
  install -d -m755 ${pkgdir}/usr/share/icons
  install -d -m755 ${pkgdir}/usr/share/themes
  install -d -m755 ${pkgdir}/usr/share/terminology
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-Icons ${pkgdir}/usr/share/icons/${_pkgname2}-Icons
  cp -r ${srcdir}/${_pkgname2}/${_pkgname3} ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/${_pkgname2}/term ${pkgdir}/usr/share/terminology
}

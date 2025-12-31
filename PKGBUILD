# Maintainer: artist for Artix Linux

pkgname=moksha-theme-passion
pkgver=2.6.18
_pkgname1=moksha-theme-redpassion
_pkgname2=MokshaRedPassion
_pkgname3=MokshaPassion
pkgrel=2
pkgdesc="Moksha Passion theme"
arch=('any')
url="https://github.com/thewaiter"
license=('BSD')
makedepends=('git' 'efl')
source=("git+${url}/${_pkgname2}.git")
sha256sums=('SKIP')
options=("!strip")

build() {
  cd "${srcdir}/${_pkgname2}/${_pkgname2}/"
  ./build.sh
}

package() {
  install -D -m644 ${srcdir}/$_pkgname2/README.md -t ${pkgdir}/usr/share/doc/$pkgname_1/README.md
  install -D -m644 ${srcdir}/$_pkgname2/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname_1}/LICENSE
  install -D -m644 ${srcdir}/${_pkgname2}/${_pkgname3}.edj -t "${pkgdir}/usr/share/enlightenment/data/themes/"
  install -d -m755 "${pkgdir}/usr/share/elementary/themes"
  cd "${pkgdir}/usr/share/elementary/themes"
  ln -s ../../enlightenment/data/themes/$_pkgname2.edj ./$_pkgname2.edj
  install -d -m755 ${pkgdir}/usr/share/icons
  install -d -m755 ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-Icons ${pkgdir}/usr/share/icons/
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-GTK ${pkgdir}/usr/share/themes/
}


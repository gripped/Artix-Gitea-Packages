# Maintainer: artist for Artix Linux

pkgname=moksha-theme-zenithal
pkgver=0.0.2
_pkgname2=zenithal
_pkgname3=MokshaZenithal
_pkgname4=Delft
_pkgname5=Delft-Gray
pkgrel=3
pkgdesc="Moksha Zenithal theme"
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
  install -D -m644 ${srcdir}/copyright -t ${pkgdir}/usr/share/doc/$pkgname
  install -D -m644 ${srcdir}/changelog.gz ${pkgdir}/usr/share/doc/$pkgname/changelog.gz
  install -D -m644 ${srcdir}/${_pkgname2}/${_pkgname3}.edj -t "${pkgdir}/usr/share/enlightenment/data/themes/"
  install -d -m755 "${pkgdir}/usr/share/elementary/themes"
  cd "${pkgdir}/usr/share/elementary/themes"
  ln -s ../../enlightenment/data/themes/$_pkgname3.edj ./$_pkgname3.edj
  install -d -m755 ${pkgdir}/usr/share/icons
  install -d -m755 ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_pkgname2}/${_pkgname4} ${pkgdir}/usr/share/icons/${_pkgname4}
  cp -r ${srcdir}/${_pkgname2}/${_pkgname5} ${pkgdir}/usr/share/icons/${_pkgname5}
  cp -r ${srcdir}/${_pkgname2}/${_pkgname3}-GTK ${pkgdir}/usr/share/themes/${_pkgname3}
}


# Maintainer: artist for Artix Linux

pkgname=moksha-theme-forum
pkgver=0.7.4.9
_pkgname2=MokshaForum
_pkgname3=forum-moksha
pkgrel=2
pkgdesc="Moksha Forum theme"
arch=('any')
url="https://github.com/thewaiter"
license=('BSD')
makedepends=('git' 'efl')
source=("git+${url}/${_pkgname2}.git")
sha256sums=('SKIP')
options=("!strip")

build() {
  cd "${srcdir}/${_pkgname2}/${_pkgname3}/"
  ./build.sh
}

package() {
  install -D -m644 ${srcdir}/$_pkgname2/README.md -t ${pkgdir}/usr/share/doc/$pkgname/README.md
  install -D -m644 ${srcdir}/$_pkgname2/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ${srcdir}/${_pkgname2}/${_pkgname2}.edj -t "${pkgdir}/usr/share/enlightenment/data/themes/"
  install -d -m755 "${pkgdir}/usr/share/elementary/themes"
  cd "${pkgdir}/usr/share/elementary/themes"
  ln -s ../../enlightenment/data/themes/$_pkgname2.edj ./$_pkgname2.edj
  install -d -m755 ${pkgdir}/usr/share/icons
  install -d -m755 ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-Icons ${pkgdir}/usr/share/icons/
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-GTK ${pkgdir}/usr/share/themes/
}


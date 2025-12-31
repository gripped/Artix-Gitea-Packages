# Maintainer: artist for Artix Linux

pkgname=moksha-theme-green
pkgver=1.17.10
_pkgname2=MokshaGreen
_pkgname3=$_pkgname2
_pkgname4=Icons-Moksha-Green
pkgrel=2
pkgdesc="Moksha Green theme"
arch=('any')
url="https://github.com/thewaiter"
license=('BSD')
makedepends=('git' 'efl')
source=("git+${url}/${_pkgname2}.git"
        "LICENSE")
sha256sums=('SKIP'
            'c7937410c48066984c66bd41f01066cda3429e03808868a48a1d8f6348a41f87')
options=("!strip")

build() {
  cd "${srcdir}/${_pkgname2}/${_pkgname3}/"
  ./build.sh
}

package() {
  install -D -m644 ${srcdir}/$_pkgname2/README.md -t ${pkgdir}/usr/share/doc/$pkgname/README.md
  install -D -m644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ${srcdir}/${_pkgname2}/${_pkgname3}.edj -t "${pkgdir}/usr/share/enlightenment/data/themes/"
  install -d -m755 "${pkgdir}/usr/share/elementary/themes"
  cd "${pkgdir}/usr/share/elementary/themes"
  ln -s ../../enlightenment/data/themes/$_pkgname3.edj ./$_pkgname3.edj
  install -d -m755 ${pkgdir}/usr/share/icons
  install -d -m755 ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_pkgname2}/${_pkgname3}-Icons ${pkgdir}/usr/share/icons/${_pkgname4}
  cp -r ${srcdir}/${_pkgname2}/${_pkgname3}-GTK ${pkgdir}/usr/share/themes/${_pkgname2}
}

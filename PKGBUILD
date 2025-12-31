# Maintainer: artist for Artix Linux

pkgname=moksha-theme-crema
pkgver=0.10.0
_pkgname2=MokshaCrema
_pkgname3=$_pkgname2
_pkgname4=Moksha-Crema
pkgrel=11
pkgdesc="Moksha Crema theme"
arch=('any')
url="https://github.com/thewaiter"
license=('BSD')
makedepends=('git' 'efl')
source=("git+${url}/${_pkgname2}.git"
        "LICENSE"
        "artix-icon.png")
sha256sums=('SKIP'
            'c7937410c48066984c66bd41f01066cda3429e03808868a48a1d8f6348a41f87'
            'd3451714f3f4751e168aee8c5030ac4f63a2f99c0d1e68dd0f3243b6530e4a95')
options=("!strip")

build() {
  cd "${srcdir}/${_pkgname2}/${_pkgname3}/"
  ./build.sh
}

package() {
  install -D -m644 ${srcdir}/$_pkgname2/README.md -t ${pkgdir}/usr/share/doc/$pkgname/README.md
  install -D -m644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ${srcdir}/${_pkgname2}/${_pkgname2}.edj -t "${pkgdir}/usr/share/enlightenment/data/themes/"
  install -d -m755 "${pkgdir}/usr/share/elementary/themes"
  cd "${pkgdir}/usr/share/elementary/themes"
  ln -s ../../enlightenment/data/themes/$_pkgname2.edj ./$_pkgname2.edj
  install -d -m755 ${pkgdir}/usr/share/icons
  install -d -m755 ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-Icons ${pkgdir}/usr/share/icons/Icons-${_pkgname4}
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-GTK ${pkgdir}/usr/share/themes/${_pkgname2}-GTK
}


# Maintainer: artist for Artix Linux

pkgname=moksha-theme-blingbling
pkgver=0.10.0.8
_pkgname2=etheme-blingbling-e20
_pkgname3=MokshaBlingBling
_pkgname4=blingbling
_pkgname5=MokshaBling
pkgrel=2
pkgdesc="Moksha Bling theme"
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
  cd "${srcdir}/${_pkgname2}/${_pkgname2}/"
  ./build.sh
}

package() {
  install -D -m644 ${srcdir}/$_pkgname2/README.md -t ${pkgdir}/usr/share/doc/$pkgname/README.md
  install -D -m644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ${srcdir}/${_pkgname2}/${_pkgname5}.edj -t "${pkgdir}/usr/share/enlightenment/data/themes/"
  install -d -m755 "${pkgdir}/usr/share/elementary/themes"
  cd "${pkgdir}/usr/share/elementary/themes"
  ln -s ../../enlightenment/data/themes/$_pkgname5.edj ./$_pkgname5.edj
  install -d -m755 ${pkgdir}/usr/share/icons
  install -d -m755 ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_pkgname2}/${_pkgname3}-Icons ${pkgdir}/usr/share/icons/Icons-Moksha-BlingBling
  cp -r ${srcdir}/${_pkgname2}/${_pkgname3}-GTK ${pkgdir}/usr/share/themes/Bling-GTK
}


# Maintainer: artist for Artix Linux

pkgname=moksha-theme-pink
pkgver=0.3.6
_pkgname2=MokshaPink
_pkgname3=$_pkgname2
pkgrel=9
pkgdesc="Moksha Pink theme"
arch=('any')
url="https://github.com/thewaiter"
license=('BSD')
makedepends=('git' 'efl')
source=("git+${url}/${_pkgname2}.git"
        "artix-icon.png")
sha256sums=('SKIP'
            'd3451714f3f4751e168aee8c5030ac4f63a2f99c0d1e68dd0f3243b6530e4a95')
options=("!strip")

prepare() {
  cd "${srcdir}/${_pkgname2}/"
  cp "${srcdir}/artix-icon.png" "./${_pkgname3}/logo_black_128.png"
  cp "${srcdir}/artix-icon.png" "./${_pkgname3}/logo_white_128.png"
  cp "${srcdir}/artix-icon.png" "./${_pkgname3}/exq-logo.png"
  cp "./${_pkgname3}/bluew.png" "./${_pkgname3}/grill_dark_tiny_pattern.png"  
}

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
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2} ${pkgdir}/usr/share/icons/
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-GTK ${pkgdir}/usr/share/themes/
}


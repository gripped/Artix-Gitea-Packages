# Maintainer: artist for Artix Linux

pkgname=moksha-theme-sunshine
pkgver=0.10.0
_pkgname2=MokshaSunshine
_pkgname3=$_pkgname2
pkgrel=11
pkgdesc="Moksha Sunshine theme"
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
  cp "${srcdir}/artix-icon.png" "./${_pkgname2}/logo.png"
  cp "${srcdir}/artix-icon.png" "./${_pkgname2}/logo2.png"
  cp "${srcdir}/artix-icon.png" "./${_pkgname2}/logo_blue_small.png"
  cp "${srcdir}/artix-icon.png" "./${_pkgname2}/logo_blue_small_glow.png"
  cp "${srcdir}/artix-icon.png" "./${_pkgname2}/icon_enlightenment.png"
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
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-Icons ${pkgdir}/usr/share/icons/Icons-Moksha-Sunshine
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-GTK ${pkgdir}/usr/share/themes/Morning\ Sunshine
}


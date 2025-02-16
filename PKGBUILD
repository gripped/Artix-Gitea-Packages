# Maintainer: artist for Artix Linux

pkgname=moksha-theme-moonlight
pkgver=0.11.0
_pkgname2=MoonLight
_pkgname3="Moksha${_pkgname2}"
_pkgname4=MokshaMoonlight
pkgrel=10
pkgdesc="Moksha Moonlight theme"
arch=('any')
url="https://github.com/rbtylee"
license=('BSD')
makedepends=('git' 'efl' 'meson' 'cmake' 'moksha')
source=("git+${url}/${_pkgname2}.git"
        "artix-icon.png")
sha256sums=('SKIP'
            'd3451714f3f4751e168aee8c5030ac4f63a2f99c0d1e68dd0f3243b6530e4a95')
options=("!strip")

prepare() {
  cd "${srcdir}/${_pkgname2}/src/${_pkgname4}/"
  cp "${srcdir}/artix-icon.png" img/logo.png
  cp "${srcdir}/artix-icon.png" img/logo2.png
}

build() {
  cd "${srcdir}/${_pkgname2}/src/${_pkgname4}/"
  ./build.sh
}

package() {
  install -D -m644 ${srcdir}/$_pkgname2/README.md -t ${pkgdir}/usr/share/doc/$pkgname/README.md
  install -D -m644 ${srcdir}/$_pkgname2/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ${srcdir}/${_pkgname2}/src/${_pkgname4}/${_pkgname4}.edj \
          -t "${pkgdir}/usr/share/enlightenment/data/themes/"
  install -d -m755 "${pkgdir}/usr/share/elementary/themes"
  cd "${pkgdir}/usr/share/elementary/themes"
  ln -s ../../enlightenment/data/themes/$_pkgname4.edj ./$_pkgname4.edj
  install -d -m755 ${pkgdir}/usr/share/icons
  install -d -m755 ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${_pkgname2}/icons/MokshaMoonlight ${pkgdir}/usr/share/icons/Icons-Moksha-Moonlight
  cp -r ${srcdir}/${_pkgname2}/gtk/MokshaMoonlight ${pkgdir}/usr/share/themes/Moonlight-GTK
}


# Maintainer: artist for Artix Linux

pkgname=moksha-theme-wood-grey
pkgver=0.1.0
_pkgname2=MokshaWoodGrey
_pkgname3=A-Wood-Grey2
pkgrel=9
pkgdesc="Moksha Wood Grey theme"
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
  install -D -m644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ${srcdir}/${_pkgname2}/${_pkgname2}.edj -t "${pkgdir}/usr/share/enlightenment/data/themes/"
}


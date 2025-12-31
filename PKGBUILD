# Maintainer: artist for Artix Linux

pkgname=moksha-theme-kl4k
pkgver=0.3.8
_pkgname2=MokshaKL4K
_pkgname3=Moksha-KLK4
_pkgname4=MokshaKLK4
pkgrel=11
pkgdesc="Moksha KL4K theme"
arch=('any')
url="https://github.com/thewaiter"
license=('BSD')
makedepends=('git' 'efl')
source=("git+${url}/${_pkgname2}.git"
        "grill_dark_tiny_pattern.png")
sha256sums=('SKIP'
            '18359b7ae6cbeb62a546c445a419b7647ff81c06b4f0dd2520af19a32492f122')
options=("!strip")

prepare() {
  cd "${srcdir}/${_pkgname2}/"
  cp "${srcdir}/grill_dark_tiny_pattern.png" "./${_pkgname2}/grill_dark_tiny_pattern.png"  
}

build() {
  cd "${srcdir}/${_pkgname2}/${_pkgname2}/"
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
  cp -r ${srcdir}/${_pkgname2}/${_pkgname4}-Icons ${pkgdir}/usr/share/icons/Icons-${_pkgname3}
  cp -r ${srcdir}/${_pkgname2}/${_pkgname2}-GTK ${pkgdir}/usr/share/themes/${_pkgname4}-GTK
}


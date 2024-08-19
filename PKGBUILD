# Maintainer: artist for Artix Linux

pkgname=enventor
pkgver=1.0.99
pkgrel=1.1
pkgdesc="EFL Edje EDC Theme Editor"
arch=('x86_64')
url="https://github.com/hermet/enventor"
license=('GPL2')
makedepends=('git')
depends=('moksha')
source=("git+https://github.com/hermet/enventor.git"
        "https://raw.githubusercontent.com/hermet/enventor/master/AUTHORS"
        "https://raw.githubusercontent.com/hermet/enventor/master/COPYING")
sha512sums=('SKIP'
            'a7c45112ef7dd5b379f5456e10bd2973a91cd3fe780219d98383e94ee2062ddc6948c7adbba1a68d2a5ce8ae51e72944225ced6790244d79c6b3d81bfe521120'
            '130058c7b60dade5d08eeedeaca9d0f2d2ab90d8442587a2ef5d8b228fbcc248985b9f6446b79ef58165d8a045ff08de9406c56f74a8f55ad4df847423d898a2')

build() {
  cd "${srcdir}/${pkgname}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  rm ${pkgdir}/usr/share/icons/enventor.png
  mkdir -p "${pkgdir}/usr/share/doc/$_pkgname"
  cp "${srcdir}/AUTHORS" "${pkgdir}/usr/share/doc/$_pkgname/"
  cp "${srcdir}/COPYING" "${pkgdir}/usr/share/doc/$_pkgname/"
}

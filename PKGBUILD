# Maintainer: Nathan <ndowens@artixlinux.org>

pkgname=shellcheck-bin
pkgver=0.9.0
pkgrel=47
pkgdesc='Shell script analysis tool (binary release)'
license=(AGPL3)
arch=(x86_64)
url='https://shellcheck.net'
conflicts=('shellcheck')
provides=('shellcheck')
source_x86_64=(https://github.com/koalaman/"${pkgname%-bin}"/releases/download/v"$pkgver"/"${pkgname%-bin}"-v"${pkgver}".linux.x86_64.tar.xz)
sha512sums_x86_64=('157fd8b2c18a257f3876e23015580ea63d27b12c4f13f87d625a180e8ca042e7501271d15edeb36e7b5780da73815b45386a33e063ab1c891d838f35c778a8ac')


package() {
    install -Dm755 "shellcheck-v${pkgver}/shellcheck" -t "${pkgdir}/usr/bin"
}

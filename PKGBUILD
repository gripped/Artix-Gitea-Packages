# Maintainer: Nathan <ndowens@artixlinux.org>

_pkgname=shellcheck

pkgname=shellcheck-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='Shell script analysis tool (binary release)'
license=(AGPL3)
arch=(x86_64)
url='https://shellcheck.net'
conflicts=('shellcheck')
provides=('shellcheck')
source_x86_64=(https://github.com/koalaman/"$_pkgname"/releases/download/v"$pkgver"/"$_pkgname"-v"${pkgver}".linux.x86_64.tar.xz)
sha512sums_x86_64=('25df28923d7d89cfdb9fa8aeef762a887f2bd4ebfbcd43ae71068c60e9458d66250b0f8d6fd66b4bc03723e6cdd47983c547e3ab4f3ea2cbc4bc4028842cc7b9')

package() {
    install -Dm755 "$_pkgname-v${pkgver}"/shellcheck -t "${pkgdir}"/usr/bin
}

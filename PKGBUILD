# Maintainer: Nathan <ndowens@artixlinux.org>

_pkgname=shellcheck

pkgname=shellcheck-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='Shell script analysis tool (binary release)'
license=(AGPL3)
arch=(x86_64)
url='https://shellcheck.net'
conflicts=('shellcheck')
provides=('shellcheck')
source_x86_64=(https://github.com/koalaman/"$_pkgname"/releases/download/v"$pkgver"/"$_pkgname"-v"${pkgver}".linux.x86_64.tar.xz)
sha512sums_x86_64=('31006830087c2b9ffe9fa36c1ab4a8b11c85078cac8203265d0cfd630c70a4a506e66dd9d7ccde964360ad95045894149de457db34f10cad76708c7a4aa544ca')

package() {
    install -Dm755 "$_pkgname-v${pkgver}"/shellcheck -t "${pkgdir}"/usr/bin
}

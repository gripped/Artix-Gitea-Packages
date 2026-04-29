# Contributor: linuxer <https://gitea.artixlinux.org/linuxer>
# Contributor: Nathan Owens <https://gitea.artixlinux.org/ndowens>
# Contributor: capezotte <https://gitea.artixlinux.org/capezotte>

pkgname=zramen-openrc
pkgdesc="OpenRC script for zramen"
pkgver=20260429
pkgrel=1
arch=('any')
url="https://gitea.artixlinux.org/"
license=('Unlicense')
groups=('openrc-galaxy')
depends=('openrc' 'zramen')
source=('zramen.initd')
b2sums=('1a1353d5c479e52994ab2fdf9bcb5dce9ee977fccbf94def7201f8a9f4bd3ee7f4bf8a525f8c9ca5d0b1e582de9cc70f298b7eda44a2d888fdde594e0dd18571')

package() {
    install -Dm 755 zramen.initd "$pkgdir/etc/init.d/zramen"
}

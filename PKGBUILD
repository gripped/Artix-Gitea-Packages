# Maintainer: artist for Artix Linux

pkgname=qbittorrent-openrc
pkgver=20240115
pkgrel=1
pkgdesc="OpenRC qBittorrent client"
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
arch=(any)
license=(GPL2)
depends=(qbittorrent openrc)
source=("qbittorrent-nox.initd"
	"qbittorrent-nox.confd")

package() {
    install -Dm755 "${srcdir}"/qbittorrent-nox.confd "${pkgdir}"/etc/conf.d/qbittorrent
    install -Dm755 "${srcdir}"/qbittorrent-nox.initd "${pkgdir}"/etc/init.d/qbittorrent
}

sha256sums=('a8b1d7d29a9fc0d5dfe68dd2a26fa688558e67f4cada595abb0972769536a74f'
            'fb2aa41fbf07361160b98e00f267ab386c433d522dfba12bbeb01ce80ebf8564')

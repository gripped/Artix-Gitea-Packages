# Maintainer: artist for Artix Linux

pkgname=qbittorrent-openrc
pkgver=20260823
pkgrel=1
pkgdesc="OpenRC qBittorrent client"
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
arch=(any)
license=(GPL2)
depends=(qbittorrent openrc)
backup=('etc/conf.d/qbittorrent')
source=("qbittorrent-nox.initd"
	"qbittorrent-nox.confd")

package() {
    install -Dm644 "${srcdir}"/qbittorrent-nox.confd "${pkgdir}"/etc/conf.d/qbittorrent
    install -Dm644 "${srcdir}"/qbittorrent-nox.initd "${pkgdir}"/etc/init.d/qbittorrent
}

sha256sums=('4243ebde845be8fcc9a2432806463f3adb06ddd9b7d41e126a7e831d7590dbdf'
            'fb2aa41fbf07361160b98e00f267ab386c433d522dfba12bbeb01ce80ebf8564')

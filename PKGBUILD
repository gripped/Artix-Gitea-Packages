# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=nfs-utils-dinit
pkgver=20211030
pkgrel=2
pkgdesc="dinit service scripts for nfs-utils"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('nfs-utils' 'rpcbind-dinit' 'device-mapper-dinit')
provides=('init-nfs-utils')
conflicts=('init-nfs-utils')
source=("nfs-server"
        "nfs-server.script"
        "statd")
sha256sums=('87b12b1bbb7af2d580fdb35a86d64bdb193c282331c3690f6e42e88914fb67b8'
            '5656eec29fc4fe0c98a9d29cafba4636ef1fcc05ba96850b8fa580b974b726ef'
            'c5be9b37acfcc4ca2376c48d07d1c65702c23d4732b202ac7135cfd7fa253b1d')

package() {
    install -Dm644 nfs-server        "$pkgdir/etc/dinit.d/nfs-server"
    install -Dm755 nfs-server.script "$pkgdir/usr/lib/dinit/nfs-server"
    install -Dm644 statd             "$pkgdir/etc/dinit.d/statd"
}

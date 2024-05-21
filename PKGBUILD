# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=redis-dinit
pkgver=20230907
pkgrel=3
pkgdesc="dinit service scripts for redis"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('redis' 'dinit')
conflicts=('init-redis')
provides=('init-redis')
source=("redis" "redis-pre" "redis-pre.script")
sha256sums=('765b38c77cbecb066d5c1f323c1f51cd29342fde45913c1977dc90e81eaa1c0b'
            'fcabda80a6c32280335295297a3ee0a34c96170d5b5f815a7a28275041dedabc'
            '389f36aca7723efecdbcb36e22e3a34496e8f577bf26e35ac30ae4a1998763f1')

package() {
    install -Dm644 redis            "$pkgdir/etc/dinit.d/redis"
    install -Dm644 redis-pre        "$pkgdir/etc/dinit.d/redis-pre"
    install -Dm755 redis-pre.script "$pkgdir/usr/lib/dinit/pre/redis"
}

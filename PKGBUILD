# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=redis-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for redis"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('redis' 'dinit')
conflicts=('init-redis')
provides=('init-redis')
source=("redis" "redis-pre" "redis-pre.script")
sha256sums=('1d99ea139c3cfabb24d0626aab5b088fa5446b0ef186a1e06c1ddfad1c9536cf'
            'c781275f44cbea8ff2bd80b74da12840036cb09c7b63d9ea9b4e846944e387a8'
            '389f36aca7723efecdbcb36e22e3a34496e8f577bf26e35ac30ae4a1998763f1')

package() {
    install -Dm644 redis            "$pkgdir/etc/dinit.d/redis"
    install -Dm644 redis-pre        "$pkgdir/etc/dinit.d/redis-pre"
    install -Dm755 redis-pre.script "$pkgdir/etc/dinit.d/scripts/redis-pre"
}

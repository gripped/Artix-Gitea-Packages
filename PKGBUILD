# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=minio-dinit
pkgver=20211102
pkgrel=3
pkgdesc="dinit service scripts for minio"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('minio' 'dinit')
conflicts=('init-minio')
provides=('init-minio')
backup=('etc/dinit.d/config/minio.conf')
source=("minio" "minio-pre" "minio.script" "minio.conf" "minio-pre.script")
sha256sums=('7c0ed0b6bb8f1d12c826b01876524683b27a2bc05c5d7d49b6bca77a6c312f68'
            'a4b06800cdf6297b1bd241c46a7306f25785031b8889600450ff71add12b6385'
            'ea51e594c571bc4b3fd01dfa8b7a4d30064c5d39cdb1c7dfa08d7c939c1f4c97'
            'c2aae7c29901bfd7ab4819228e5793ca12ad519a02f05d4429e3c292ff8f1392'
            '50186a39dc83884702b1a014c690f0d7b06d1728f70f88a5a008cdd43ec882ba')

package() {
    install -Dm644 minio            "$pkgdir/etc/dinit.d/minio"
    install -Dm644 minio-pre        "$pkgdir/etc/dinit.d/minio-pre"
    install -Dm644 minio.conf       "$pkgdir/etc/dinit.d/config/minio.conf"
    install -Dm755 minio.script     "$pkgdir/usr/lib/dinit/minio"
    install -Dm755 minio-pre.script "$pkgdir/usr/lib/dinit/pre/minio"
}

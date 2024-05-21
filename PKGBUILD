# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=sddm-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service scripts for sddm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('sddm' 'init-logind')
provides=('init-sddm' 'init-displaymanager')
conflicts=('init-sddm' 'init-displaymanager')
source=("sddm" "sddm-pre")
sha256sums=('4ea752635af8b2da6e094244a71f3219ee1dde119109b5c66cbd90083376eefb'
            'b076e611b34f5c2cc32fab6b5f1409b3e2d35b455eba447da5daa665a05598a9')

package() {
    install -Dm644 sddm     "$pkgdir/etc/dinit.d/sddm"
    install -Dm644 sddm-pre "$pkgdir/etc/dinit.d/sddm-pre"
}

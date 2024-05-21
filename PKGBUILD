# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=wpa_supplicant-dinit
pkgver=20230906
pkgrel=2
pkgdesc="dinit service scripts for wpa_supplicant"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-system')
depends=('wpa_supplicant' 'dinit')
provides=('init-wpa_supplicant')
conflicts=('init-wpa_supplicant')
backup=('etc/dinit.d/config/wpa_supplicant.conf')
source=("wpa_supplicant" "wpa_supplicant.conf")
sha256sums=('c9259351fecdb5319e4d9e06aaabe849c9c4f68e1fe27c02d120d24c42660f89'
            '5e4895ab63458d079e50fea1c6b9752bf6302c885c0a36d48932b3aa205c2541')

package() {
    install -Dm644 wpa_supplicant      "$pkgdir/etc/dinit.d/wpa_supplicant"
    install -Dm644 wpa_supplicant.conf "$pkgdir/etc/dinit.d/config/wpa_supplicant.conf"
}

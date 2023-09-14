# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=wpa_supplicant-dinit
pkgver=20230906
pkgrel=1
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
sha256sums=('155510d9f27830633b81abbfece5ff29b5a437db6ff4da7ea998303a53bcb240'
            '5e4895ab63458d079e50fea1c6b9752bf6302c885c0a36d48932b3aa205c2541')

package() {
    install -Dm644 wpa_supplicant      "$pkgdir/etc/dinit.d/wpa_supplicant"
    install -Dm644 wpa_supplicant.conf "$pkgdir/etc/dinit.d/config/wpa_supplicant.conf"
}

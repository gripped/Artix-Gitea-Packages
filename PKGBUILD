# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lm_sensors-dinit
pkgver=20211030
pkgrel=4
pkgdesc="dinit service scripts for lm_sensors"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('lm_sensors' 'dinit')
conflicts=('init-lm_sensors')
provides=('init-lm_sensors')
source=("fancontrol"
        "lm_sensors"
        "lm_sensors.script")
sha256sums=('034ae7f1d010dd46ff6d569e58c4845d5f4bab655a8dc50a60de258d44b13896'
            'f5157423fbe15f5fd27fb553d11b188af0825e740bfa90d0d8d4cf9dc56494f8'
            'c5da0837a079f713fdde921031a168ab9c421d206b0c92a3f4af6e05fe79e437')

package() {
    install -Dm644 fancontrol        "$pkgdir/etc/dinit.d/fancontrol"
    install -Dm644 lm_sensors        "$pkgdir/etc/dinit.d/lm_sensors"
    install -Dm755 lm_sensors.script "$pkgdir/etc/dinit.d/scripts/lm_sensors"
}

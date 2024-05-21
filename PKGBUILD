# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lm_sensors-dinit
pkgver=20211030
pkgrel=6
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
sha256sums=('146267350ea6664bbfd04fbb6ce8fac41b17904cafe49a46712c8135ed18a1ea'
            '2042afeebeb43e644e1537c250a951f100d761c1109da45ad2fca22141d378ab'
            'c5da0837a079f713fdde921031a168ab9c421d206b0c92a3f4af6e05fe79e437')

package() {
    install -Dm644 fancontrol        "$pkgdir/etc/dinit.d/fancontrol"
    install -Dm644 lm_sensors        "$pkgdir/etc/dinit.d/lm_sensors"
    install -Dm755 lm_sensors.script "$pkgdir/usr/lib/dinit/lm_sensors"
}

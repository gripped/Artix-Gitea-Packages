# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lightdm-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service scripts for lightdm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('lightdm' 'dbus-dinit')
provides=('init-lightdm' 'init-displaymanager')
conflicts=('init-lightdm' 'init-displaymanager')
source=("lightdm" "lightdm-pre")
sha256sums=('a0a934aacf6cb7692aee635b54da7de8a3839d79fecbd845b8afb536634a34f5'
            '5566576991fcd8c506b169bc08ee30f045a9f10c12279961bc10a878d4c28536')

package() {
    install -Dm644 lightdm     "$pkgdir/etc/dinit.d/lightdm"
    install -Dm644 lightdm-pre "$pkgdir/etc/dinit.d/lightdm-pre"
}

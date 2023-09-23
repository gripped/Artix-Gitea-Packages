# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=gdm-dinit
pkgver=20230923
pkgrel=1
pkgdesc="dinit service scripts for gdm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('gdm' 'dbus-dinit')
provides=('init-gdm' 'init-displaymanager')
conflicts=('init-gdm' 'init-displaymanager')
source=("gdm" "gdm.script")
sha256sums=('18af23e3aae1ad7044edc21997ae5affbec14bf21ecbba237be837b8d07bacce'
            'e51bcec3f62565ca173025014ed6d20537aeeda827cc6e987f6623ba0e0489e4')

package() {
    install -Dm644 gdm        "$pkgdir/etc/dinit.d/gdm"
    install -Dm755 gdm.script "$pkgdir/usr/lib/dinit/gdm"
}

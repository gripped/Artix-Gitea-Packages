# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=gdm-dinit
pkgver=20230906
pkgrel=1
pkgdesc="dinit service scripts for gdm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('gdm' 'dbus-dinit')
provides=('init-gdm' 'init-displaymanager')
conflicts=('init-gdm' 'init-displaymanager')
source=("gdm" "gdm-pre")
sha256sums=('56dcd8e61a657c196db7c816df28639e4c5b539edf0b331c0fbc2a62159df6e4'
            '2b82aede8a74a67e9f5305819318464fbe7f9ce55159bd4b877714ff3019eef8')

package() {
    install -Dm644 gdm     "$pkgdir/etc/dinit.d/gdm"
    install -Dm755 gdm-pre "$pkgdir/etc/dinit.d/gdm-pre"
}

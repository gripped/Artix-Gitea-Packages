# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lightdm-dinit
pkgver=20230907
pkgrel=2
pkgdesc="dinit service scripts for lightdm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('lightdm' 'dbus-dinit')
provides=('init-lightdm' 'init-displaymanager')
conflicts=('init-lightdm' 'init-displaymanager')
source=("lightdm" "lightdm-pre")
sha256sums=('14c6636f38c0b54f3ac1f733b7025f29667b88df5e742f2a1e006f17204b818b'
            'a4fb1bff94a4acd115a1ee43ac2a2fde2f252650f105c108ce79a3b3bbb127b9')

package() {
    install -Dm644 lightdm     "$pkgdir/etc/dinit.d/lightdm"
    install -Dm644 lightdm-pre "$pkgdir/etc/dinit.d/lightdm-pre"
}

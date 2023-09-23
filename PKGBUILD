# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=audit-dinit
pkgver=20211031
pkgrel=4
pkgdesc="dinit service script for audit"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('audit' 'dinit')
groups=('dinit-system')
conflicts=('init-audit')
provides=('init-audit')
backup=('etc/dinit.d/config/auditctl.conf')
source=("auditd"
        "auditctl"
        "auditctl.script"
        "auditctl.conf")
sha256sums=('5351582b8421db26ef885cfcc6e8519b5ae2e643871b72a2f41a2c9287f5e211'
            'd4c006d4a21504d806ad5c23d2ffb8b6de55969f85f52d3b488ec16ec0165132'
            '321281306004be041a9adc6255b7112e22351352675072db0cc96e499fd4be5c'
            '67adef67c32704dcaf62d8ab827467647253de7b38e0254ec5120b8b87357015')

package() {
    install -Dm644 auditd          "$pkgdir/etc/dinit.d/auditd"
    install -Dm644 auditctl        "$pkgdir/etc/dinit.d/auditctl"
    install -Dm644 auditctl.conf   "$pkgdir/etc/dinit.d/config/auditctl.conf"
    install -Dm755 auditctl.script "$pkgdir/usr/lib/dinit/auditctl"
}

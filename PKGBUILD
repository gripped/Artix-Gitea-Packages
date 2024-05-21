# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=audit-dinit
pkgver=20211031
pkgrel=5
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
sha256sums=('91bca8a4f86589cf82ede8a4615a8dc61ed787c7b6e516d674d902fa3a65da3c'
            '80260bae63fa126cc79b73c2722083cf50306901d4da285c2f374490315cf4e5'
            '321281306004be041a9adc6255b7112e22351352675072db0cc96e499fd4be5c'
            '67adef67c32704dcaf62d8ab827467647253de7b38e0254ec5120b8b87357015')

package() {
    install -Dm644 auditd          "$pkgdir/etc/dinit.d/auditd"
    install -Dm644 auditctl        "$pkgdir/etc/dinit.d/auditctl"
    install -Dm644 auditctl.conf   "$pkgdir/etc/dinit.d/config/auditctl.conf"
    install -Dm755 auditctl.script "$pkgdir/usr/lib/dinit/auditctl"
}

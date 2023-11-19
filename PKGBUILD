# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname=vault-runit
pkgver=20231119
pkgrel=2
pkgdesc='Runit service script for vault'
arch=(any)
url='https://artixlinux.org'
license=(BSD)
# Note: While this PKGBUILD is licensed under BSD-3 terms, all of the
#       included runscript should follow it's main package's licenses.
depends=(vault runit)
groups=(runit-world)
provides=(init-vault)
conflicts=(init-vault)
source=(vault.run vault.log.run)
sha512sums=('49a975b033ad312e4bb256a217eecf09084ba8e9606807d8045ebd40a932b8b00dcd7db1dd7d919bea09f289f5d1621ffc29c311b10a765ece4e112936669fd7'
            'f60bc437ed03765544d01fc6bf12eeffc5bbda7f32b51a2a70ea21321f04cd10f871b7e2732b4e3bc6080b9e670c6bc8b85792fb0de7e3a0f4072351dec19665')

package() {
    cd "$srcdir"
    install -Dm755 vault.run "$pkgdir/etc/runit/sv/vault/run"
    install -Dm755 vault.log.run "$pkgdir/etc/runit/sv/vault/log/run"
}

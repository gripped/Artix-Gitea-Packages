# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname=vault-runit
pkgver=20231119
pkgrel=1
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
sha512sums=('13e55dcc85ed6b83b5316496c7b33085fbc259b0691e2152149e2fc7a02f0f3e2243c66e7b100c9bec5d2517a83fb887baee59ac18d7c076a19584dc6252d2d6'
            'f60bc437ed03765544d01fc6bf12eeffc5bbda7f32b51a2a70ea21321f04cd10f871b7e2732b4e3bc6080b9e670c6bc8b85792fb0de7e3a0f4072351dec19665')

package() {
    cd "$srcdir"
    install -Dm755 vault.run "$pkgdir/etc/runit/sv/vault/run"
    install -Dm755 vault.log.run "$pkgdir/etc/runit/sv/vault/log/run"
}

# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname=greetd-runit
pkgver=20231119
pkgrel=1
pkgdesc='Runit service script for greetd'
arch=(any)
url='https://artixlinux.org'
license=(BSD)
depends=(logind-runit greetd runit)
groups=(runit-world)
provides=(init-greetd)
conflicts=(init-greetd)
source=(greetd.run greetd.log.run)
sha512sums=('dff7d5aced1eea18dbc379763b8d99a1cd20c2bae2bcecee57e99cb55f41458b226eb04d0e4e9ff24b8c66b96d6210535ff45ce52fe8e129fc8e6fd0dd8beba8'
            '7315606b04bf5e42bb70460080a1309c5825bbd2f61218de64d3c4bfd7cd6c2498dabdaf0e2dbd6fdce7ddfdf46df595335f7adb20cc9c70d651667bbe9c6b0d')

package() {
    cd "$srcdir"
    install -Dm755 greetd.run "$pkgdir/etc/runit/sv/greetd/run"
    install -Dm755 greetd.log.run "$pkgdir/etc/runit/sv/greetd/log/run"
}

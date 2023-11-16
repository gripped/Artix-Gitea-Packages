# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
# Contributor: linuxer <https://gitea.artixlinux.org/linuxer>

pkgname=i2pd-runit
pkgdesc="i2pd runit service script"
pkgver=20231116
pkgrel=1
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-galaxy')
depends=('runit' 'i2pd')
provides=('init-i2pd')
conflicts=('init-i2pd')
source=("i2pd.run" 'i2pd.log.run')
sha256sums=('8fb5f2933637cc4f12e60a66a0fc3555bf84a1435e5994fe93ae7551c1310272'
            '1a1cf941b23ffb306e5dec4bd1aa8ad58b9a463bbefa96ab1b41794e7e45b438')

package() {
    install -Dm755 i2pd.run "$pkgdir/etc/runit/sv/i2pd/run"
    install -Dm755 i2pd.log.run "$pkgdir/etc/runit/sv/i2pd/log/run"
}

# Maintainer: linuxer <https://gitea.artixlinux.org/linuxer>
# Contributor: capezotte <capezotte@artixlinux.org>

pkgname=i2pd-openrc
pkgdesc="i2pd OpenRC init script"
pkgver=20260828
pkgrel=2
arch=('any')
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
groups=('openrc-galaxy')
license=('GPL2')
depends=('openrc' 'i2pd')
provides=('init-i2pd')
conflicts=('init-i2pd')
source=( i2pd.{init,conf}d )
backup=( 'etc/conf.d/i2pd' )
b2sums=('20a30acc0109ebcc1e865e56e0b05769fd5aa9abe282869a61d39ca79e755a6774c009220119c10dd07e1559b77884961f9c2c1c93eefbb47c9e52411f19d50b'
        '8bc1c1ccc404b5f39b173d839c8f55a6ec0d589bee7b5bacff7c7a554d6a83d00976e66de1acc879433762ec442257dae996661c16899ef3e16fe98f9732e5cd')

package() {
    install -Dm755 i2pd.initd "$pkgdir/etc/init.d/i2pd"
    install -Dm755 i2pd.confd "$pkgdir/etc/conf.d/i2pd"
}

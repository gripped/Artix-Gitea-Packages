# Contributor: linuxer <https://gitea.artixlinux.org/linuxer>
# Contributor: Nathan Owens <https://gitea.artixlinux.org/ndowens>
# Contributor: capezotte <https://gitea.artixlinux.org/capezotte>

pkgname=ofono-openrc
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications support for OpenRC Init"
pkgver=20210119
pkgrel=2
arch=('any')
url="https://gitea.artixlinux.org/"
license=('BSD-3-Clause')
groups=('openrc-galaxy')
depends=('openrc' 'ofono')
source=('ofonod.initd')
b2sums=('e3e0e1aff450411342314d124223d14643a978c8f1e9fd35c6ccde7cd0913fd0bf7d0fd9215ad05364a185b1c8a5d983dfbe1a84ee2cf1526072bb824ef377d9')

package() {
    install -Dm 755 ofonod.initd "$pkgdir/etc/init.d/ofonod"
}

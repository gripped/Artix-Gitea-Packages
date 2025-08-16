# Maintainer: nous <nous@artixlinux.org>

_pkgname=artix-branding

pkgname=artix-branding-base
pkgver=20250816
pkgrel=1
pkgdesc="Base branding for Artix ISOs"
arch=('any')
groups=('artix-branding')
url="https://gitea.artixlinux.org/artix/artix-branding"
optdepends=('fastfetch')
makedepends=('git')
license=('GPL3')
# backup=('etc/rc.local')
_commit=01116064d83f4e8f120ae65dfec544755cc9a0ff
source=("git+${url}.git#commit=${_commit}")
#install=$pkgname.install
sha256sums=('c5283eae57c96d432604550c61b0061df01f855791a9c0563337155cc1ade323')

package() {
    cd "$_pkgname/$pkgname"
#    git checkout ${_branch}
    install -dm755 $pkgdir/etc
    cp -r etc/* $pkgdir/etc
}

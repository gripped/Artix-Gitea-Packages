# Maintainer: nous <nous@artixlinux.org>

_pkgname=artix-branding

pkgname=artix-branding-base
pkgver=20250816
pkgrel=2
pkgdesc="Base branding for Artix ISOs"
arch=('any')
groups=('artix-branding')
url="https://gitea.artixlinux.org/artix/artix-branding"
optdepends=('fastfetch')
makedepends=('git')
license=('GPL3')
backup=('etc/rc.local')
_commit=4573639aadefeacd4b48ded9c17df84674b40318
source=("git+${url}.git#commit=${_commit}")
#install=$pkgname.install
sha256sums=('b7f4fb004b06217be7b0f71b35e5ac6fae1a132277968ac247cd719665afc885')

package() {
    cd "$_pkgname/$pkgname"
#    git checkout ${_branch}
    install -dm755 $pkgdir/etc
    cp -r etc/* $pkgdir/etc
}

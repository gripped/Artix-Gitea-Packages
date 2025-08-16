# Maintainer: nous <nous@artixlinux.org>

_pkgname=artix-branding

pkgname=artix-branding-base
pkgver=20250817
pkgrel=1
pkgdesc="Base branding for Artix ISOs"
arch=('any')
groups=('artix-branding')
url="https://gitea.artixlinux.org/artix/artix-branding"
optdepends=('fastfetch')
makedepends=('git')
license=('GPL3')
backup=("etc/local.d/{artix-icons,branding,cleanup,change-machine-id,local,ps1}.start" '/etc/bash/bashrc.d/local.bashrc')
_commit=921e5570d2ccec9db376ce432f53a7a3723f0be5
source=("git+${url}.git#commit=${_commit}")
#install=$pkgname.install
sha256sums=('437446fd8c0744518c9c8ffd2928ed13910060888b28c38665f04c0977e393a1')

package() {
    cd "$_pkgname/$pkgname"
#    git checkout ${_branch}
    install -dm755 $pkgdir/etc
    cp -r etc/* $pkgdir/etc
}

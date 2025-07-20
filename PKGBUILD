# Maintainer: nous <nous@artixlinux.org>

_pkgname=artix-branding

pkgname=artix-branding-base
pkgver=20250720
pkgrel=1
pkgdesc="Base branding for Artix ISOs"
arch=('any')
groups=('artix-branding')
url="https://gitea.artixlinux.org/artix/artix-branding"
optdepends=('fastfetch')
makedepends=('git')
license=('GPL3')
backup=('etc/rc.local')

#_commit=9f07561ecc8f664df36866538a1bcbeea3ebd3ba
#source=("git+${url}.git#commit=${_commit}")
source=("git+${url}.git")
# _branch='master'
# source=("git+$url.git#branch=${_branch}")
install=$pkgname.install
sha256sums=('SKIP')

package() {
    cd "$_pkgname/$pkgname"
#    git checkout ${_branch}
    install -dm755 $pkgdir/etc
    cp -r etc/* $pkgdir/etc
}

# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

_repo=artwork
#_commit=22f17c8bbff67b32e2646cb7f132d755ee9a8199
pkgbase=artix-artwork
pkgname=('artix-icons'
        'artix-backgrounds'
        'artix-wallpapers')
pkgver=2026.05
pkgrel=1
pkgdesc='Artix icons, backgrounds and wallpapers'
arch=('any')
url="https://gitea.artixlinux.org/artix/artwork"
license=('GPL')
makedepends=('git' 'hicolor-icon-theme')
#source=("git+$url.git#commit=$_commit")
source=("git+${url}.git")
sha256sums=('SKIP')

# pkgver() {
#     date +%Y.%m
# }

package_artix-icons(){
    pkgdesc='Artix icons'
    depends=('hicolor-icon-theme')
    groups=('artix-style')

    make -C "$_repo" PREFIX=/usr DESTDIR="$pkgdir" install_icons install_logo
}

package_artix-backgrounds(){
    pkgdesc='Artix backgrounds'
    groups=('artix-branding')

    make -C "$_repo" PREFIX=/usr DESTDIR=${pkgdir} install_backgrounds
}

package_artix-wallpapers(){
    pkgdesc='Artix wallpapers'
    groups=('artix-style')

    install -d "$pkgdir"/usr/share
    cp -rv "$_repo"/wallpapers "$pkgdir"/usr/share/
}

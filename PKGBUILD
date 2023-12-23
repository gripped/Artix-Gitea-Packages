# Maintainer: artoo <artoo@artixlinux.org>

_repo=artwork
_commit=b9b1f47e1b99a650339b0075b9ac5b11ffc29a3e

pkgbase=artix-artwork
pkgname=('artix-wallpapers' 'artix-icons' 'artix-backgrounds')
pkgver=1
pkgrel=3
pkgdesc='Artix wallpapers'
arch=('any')
url="https://gitea.artixlinux.org/artix/artwork"
license=('GPL')
makedepends=('git')
source=("git+https://gitea.artixlinux.org/artix/artwork.git#commit=$_commit")
sha256sums=('SKIP')

package_artix-wallpapers(){
    pkgdesc='Artix wallpapers'
    groups=('artix-style')

    install -d "$pkgdir"/usr/share
    cp -rv "$_repo"/wallpapers "$pkgdir"/usr/share/
}

package_artix-icons(){
    pkgdesc='Artix icons'
    groups=('artix-style')

    make -C "$_repo" PREFIX=/usr DESTDIR="$pkgdir" install_icons install_logo
}

package_artix-backgrounds(){
    pkgdesc='Artix backgrounds'
    groups=('artix-branding')

    make -C "$_repo" PREFIX=/usr DESTDIR=${pkgdir} install_backgrounds
}

# Maintainer: artoo <artoo@artixlinux.org>

_repo=artwork
_commit=ffe87aae26f9c8f29e991cf8eb875c642e995b3d

pkgbase=artix-artwork
pkgname=('artix-icons'
        'artix-backgrounds'
        'artix-breeze-sddm'
        'artix-grub-theme'
        'artix-plasma-splash'
        'artix-wallpapers')
pkgver=2023.12
pkgrel=7
pkgdesc='Artix wallpapers'
arch=('any')
url="https://gitea.artixlinux.org/artix/artwork"
license=('GPL')
makedepends=('git' 'hicolor-icon-theme')
source=("git+$url.git#commit=$_commit")
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

package_artix-grub-theme() {
    groups=('artix-style')

    make -C "$_repo" PREFIX=/usr DESTDIR=${pkgdir} install_grub_theme
}

package_artix-breeze-sddm() {
    pkgdesc='Artix breeze sddm theme customization'
    groups=('artix-style')

    make -C "$_repo" PREFIX=/usr DESTDIR=${pkgdir} install_sddm_theme
}

package_artix-grub-theme() {
    pkgdesc='Artix grub theme'
    groups=('artix-style')

    make -C "$_repo" PREFIX=/usr DESTDIR=${pkgdir} install_grub_theme
}

package_artix-wallpapers(){
    pkgdesc='Artix wallpapers'
    groups=('artix-style')

    install -d "$pkgdir"/usr/share
    cp -rv "$_repo"/wallpapers "$pkgdir"/usr/share/
}

package_artix-plasma-splash(){
    pkgdesc='Artix plasma desktop splash screen'
    groups=('artix-style')

    install -d "$pkgdir"/usr/share/plasma/look-and-feel
    cp -rv "$_repo"/plasma/look-and-feel/ArtixTube "$pkgdir"/usr/share/plasma/look-and-feel/
}

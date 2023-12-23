# Maintainer: artoo <artoo@artixlinux.org>

_repo=artwork
_commit=ed0896722da18c797d8183fbb23d7bbad4189e3f

pkgbase=artix-artwork
pkgname=('artix-icons' 'artix-backgrounds' 'artix-wallpapers' 'artix-breeze-sddm' 'artix-grub-theme')
pkgver=2023.12
pkgrel=2
pkgdesc='Artix wallpapers'
arch=('any')
url="https://gitea.artixlinux.org/artix/artwork"
license=('GPL')
makedepends=('git' 'hicolor-icon-theme')
source=("git+https://gitea.artixlinux.org/artix/artwork.git#commit=$_commit")
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

package_artix-grub-theme() {
    groups=('artix-style')

    make -C "$_repo" PREFIX=/usr DESTDIR=${pkgdir} install_theme
}

package_artix-breeze-sddm() {
    pkgdesc='Artix breeze sddm theme customization'
    groups=('artix-style')

    install -d "$pkgdir"/usr/share/sddm/themes
    cp -vr "$_repo"/artix-breeze-sddm "$pkgdir"/usr/share/sddm/themes/
}

package_artix-grub-theme() {
    pkgdesc='Artix grub theme'
    groups=('artix-style')

    make -C "$_repo" PREFIX=/usr DESTDIR=${pkgdir} install_grub_theme
}

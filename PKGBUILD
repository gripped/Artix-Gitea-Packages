# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: tobias [tobias at archlinux.org]

pkgname=mousepad
pkgver=0.7.0
pkgrel=1
pkgdesc="Simple text editor for Xfce"
arch=('x86_64')
url="https://docs.xfce.org/apps/mousepad/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('gtksourceview4' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git' 'glib2-devel' 'gspell' 'libxfce4ui' 'meson' 'polkit' 'xfce4-dev-tools')
optdepends=('gspell: spell checking plugin'
            'libxfce4ui: shortcuts editor plugin')
source=("git+https://gitlab.xfce.org/apps/mousepad.git#tag=$pkgname-$pkgver")
sha256sums=('2dd1e562bce47f6480994e234aff4dcfcf2c1ce22c9eea8dcc2cf06a2787fc11')

build() {
  artix-meson $pkgname build \
    --localstatedir=/var
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:

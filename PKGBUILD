# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Based on gnome-control-center:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Jan de Groot <jgc@archlinux.org>

pkgname=cinnamon-control-center
pkgver=6.0.1
pkgrel=1
pkgdesc="The Control Center for Cinnamon"
arch=(x86_64)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL)
depends=(cinnamon-settings-daemon cinnamon-menus colord
         libgnomekbd libmm-glib nm-connection-editor)
optdepends=('cinnamon-translations: i18n'
            'gnome-color-manager: for color management tasks'
            'gnome-online-accounts: for the online accounts module')
makedepends=(meson samurai gnome-online-accounts git)
options=(!emptydirs)
source=(${pkgname}-${pkgver}::git+${url}.git)
sha256sums=('SKIP')
b2sums=('SKIP')

build() {
  artix-meson build ${pkgname}-${pkgver}
  samu -C build
}

package() {
  DESTDIR="${pkgdir}" samu -C build install
  # https://github.com/linuxmint/Cinnamon/pull/7382#issuecomment-374894901
  # /usr/bin/cinnamon-control-center is not meant for users, it is a development troubleshooting tool.
  # Just install the shell libs/headers.
  rm "${pkgdir}"/usr/bin/cinnamon-control-center
  rm "${pkgdir}"/usr/share/cinnamon-control-center/ui/shell.ui
}

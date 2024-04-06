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
makedepends=(meson samurai gnome-online-accounts)
options=(!emptydirs)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
        goa.patch)
sha256sums=('0181054ae73b8abbf3d7862f91a56df56f6d4aa9b28d28801813514a8bbdbeb6'
            '272eadf282ac9683cf728b647147b29707c0d8cd8360987c6018388faf6d0b4d')
b2sums=('51796dec219922f9d4639aa106963f51e33978c9415756c6195f5444a8aab7114b4110e5e23251056314284f0b7a142366404301dcd410b86b4f7eb28235916d'
        '6d61eaf5d318308b35d4bd95ddece6869ab4a4754e55a697a3be823518fb2c1d2539906bc49c0c05a8d4bae2f2f48b14630e561391ee1ca211e190815fbaf85c')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../goa.patch
}

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

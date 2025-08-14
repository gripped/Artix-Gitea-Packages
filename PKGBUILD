# Maintainer: artist for Artix Linux

pkgname=lightdm-slick-greeter
_pkgname=slick-greeter
pkgver=2.2.2
pkgrel=1
pkgdesc='A slick-looking LightDM greeter'
arch=('x86_64')
url="https://github.com/linuxmint/slick-greeter"
license=('GPL3')
depends=('cairo' 'freetype2' 'gtk3' 'libcanberra' 'libxext' 'lightdm' 'pixman'
         'python' 'xorg-server' 'xapp')
optdepends=('numlockx: enable numerical keypad on supported keyboard')
makedepends=('meson' 'intltool' 'vala' 'gnome-common')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('9000de222c97a872d6d56a21ab889cedda60c0523533d7c43e3518f8b2221444d451d49d628979f0698d7375343fd349c73196722d928b933ee7041d2d5c4179')
b2sums=('b4afe74dee3f0081778444f01eb9fca32baef91c09938e6783f5e8b9f2a4f991ebd6b876577e4ba8e1941b30268ebc013bae10fd169544ae657092cbd43140e3')


build() {
  artix-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # adjust launcher name
  mv $pkgdir/usr/share/xgreeters/slick-greeter.desktop \
    $pkgdir/usr/share/xgreeters/lightdm-slick-greeter.desktop
}


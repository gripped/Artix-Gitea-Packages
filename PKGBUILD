# Maintainer: artist for Artix Linux

pkgname=lightdm-slick-greeter
_pkgname=slick-greeter
pkgver=2.2.1
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
sha512sums=('e5c9136835a10f7a7a0318cd1876339573e89d53e9d826e0bf8292102c1c65f58bc3157e5677831c36b98f5755561af387b5a5eb01f1397c431f01124ba63740')
b2sums=('ab2c806295cf9e3cc9b873bd11cfac3090a83699e82b8da980732fdc0c6e2a13a0dfe04ff667c5f4a4da490859934890e16478ec27479a9ddc46daed331ec157')


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


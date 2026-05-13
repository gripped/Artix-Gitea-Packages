# Maintainer: artist for Artix Linux

pkgname="moksha-module-picom"
_module=PicomMod
pkgver=0.0.1
pkgrel=1
_commit=343c00ef868dadf2e5dd26e3ec0caa541445583b
pkgdesc="Picom module for Moksha desktop"
arch=('x86_64')
url="https://github.com/thewaiter/$_module"
license=('GPL3')
makedepends=('git' 'meson' 'cmake' 'libtool' 'intltool')
depends=('picom' 'moksha' 'efl')
provides=("moksha-module-compton")
conflicts=("moksha-module-compton")
replaces=("moksha-module-compton")
source=("git+$url.git#commit=$_commit")
group=('moksha-modules-extra')

build() {
  cd "$srcdir/$_module"
  meson --prefix=/usr . build
  meson configure build
  ninja -C build
}

package() {
  cd "$srcdir/$_module"
  DESTDIR="${pkgdir}" ninja -C build install
  sed -i 's|Icon=e-module-picommod|Icon=module_icon|' "${pkgdir}/usr/lib/enlightenment/modules/picommod/module.desktop"
  install -Dm644 -t "${pkgdir}/usr/lib/enlightenment/modules/picommod/" "data/images/module_icon.png"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}

sha256sums=('cfcf7d519e07d76a008484dac5be0d5acfc15dd771d5caea0f4ab2c3f69b4a5f')


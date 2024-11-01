# Maintainer: artist for Artix Linux

pkgname=pwvucontrol
pkgver=0.4.6
pkgrel=1
pkgdesc="Pipewire volume control"
url="https://github.com/saivert/pwvucontrol"
arch=(x86_64)
license=(GPL-3.0-only)

depends=(glib2 gtk4 libadwaita wireplumber libwireplumber-4.0-compat)
makedepends=(rust clang meson cmake git)

source=(
  "git+https://github.com/saivert/pwvucontrol.git"
  "pwvucontrol.desktop"
)

b2sums=('SKIP'
        'fcc137332b78c9a80232df0c2023c833319b09152d1a29d078d82226c5e7638d3f1ffed7dbeab9f4cd6869556a417d84b3c5f10e17ba1cb56b632cfe22662be7')

build() {
  artix-meson --reconfigure $pkgname build
  meson install -C build --destdir mydestdir
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  cp -rv build/mydestdir/usr "${pkgdir}"
  install -Dm644 "${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 pwvucontrol.desktop "${pkgdir}/usr/share/applications/com.saivert.pwvucontrol.desktop"
}


# Maintainer: artist for Artix Linux

pkgname=wf-shell
pkgver=0.9.0
pkgrel=2
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64)
license=(MIT)
depends=(wf-config gtkmm3 gtk-layer-shell libdbusmenu-gtk3 libpulse)
makedepends=(wayland wayfire wayland-protocols meson ninja gobject-introspection glib2-devel)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")

build () {
  artix-meson "${pkgname}-${pkgver}" build -Dpulse=enabled
  ninja -C build
}

package () {
  DESTDIR="${pkgdir}" ninja -C build install
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 wf-shell.ini.example "${pkgdir}/usr/share/doc/${pkgname}/wf-shell.ini.example"
}

sha256sums=('c8ac529b9fa6a4f65bd430140394b6b6a486c7b2def6c22b811396612ba94bb4')


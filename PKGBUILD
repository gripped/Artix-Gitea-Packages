# Maintainer: artist for Artix Linux

pkgname=wf-shell
pkgver=0.9.0
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64)
license=(MIT)
depends=(wf-config gtkmm3 gtk-layer-shell libdbusmenu-gtk3 libpulse)
makedepends=(wayland wayfire wayland-protocols meson ninja gobject-introspection glib2-devel)
source=("${pkgname}::https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('SKIP')

build () {
	rm -rf build
	artix-meson "${pkgname}" build -Dpulse=enabled
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
	cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 wf-shell.ini.example "${pkgdir}/usr/share/doc/${pkgname}/wf-shell.ini.example"
}

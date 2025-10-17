# Maintainer: artist for Artix Linux

pkgname=pwvucontrol
pkgver=0.5.0
pkgrel=1
pkgdesc="Pipewire volume control"
url="https://github.com/saivert/$pkgname"
arch=(x86_64)
license=(GPL-3.0-only)

depends=(glib2 gtk4 libadwaita wireplumber libwireplumber-4.0-compat)
makedepends=(rust clang meson cmake)

source=(
  "$url/archive/refs/tags/$pkgver.tar.gz"
  "pwvucontrol.desktop"
)

b2sums=('e95284c58d56e78fda0e2bd0a9af2149530cb3df0e70fb6fe11ac87f50539ffb28c7679f76f5662a3ccd700ef4a59eb65063ff7f4fa514cdaf7038df13feb6d8'
        'fcc137332b78c9a80232df0c2023c833319b09152d1a29d078d82226c5e7638d3f1ffed7dbeab9f4cd6869556a417d84b3c5f10e17ba1cb56b632cfe22662be7')

build() {
  meson setup --prefix=/usr --buildtype=plain $pkgname-$pkgver build
  meson compile -C build
  meson install -C build --destdir installdir
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  cp -rv build/installdir/usr "${pkgdir}"
  install -Dm644 "${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 pwvucontrol.desktop "${pkgdir}/usr/share/applications/com.saivert.pwvucontrol.desktop"
}


# Maintainer: artist for Artix Linux

pkgname=pwvucontrol
pkgver=0.4.9
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

b2sums=('7f4149b8cdc7bd94ce3aff4bd5ac7bc2ddf4b93d323652673f1b32cfa56511a0dc6c89fd707f9582f3dac67467a53fec85e419cd9a137492c9b29f827a851525'
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


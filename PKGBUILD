# Maintainer: artist for Artix Linux

pkgname=pwvucontrol
pkgver=0.5.1
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

b2sums=('d66be3bc85624a770f769ff86d4531ae565436348df8b0e96b8b488b6c06217706b4cc43a387fe745083bd6444827750e2d8a73453ac1726164aad3da104a809'
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


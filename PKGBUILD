# Maintainer: artist for Artix Linux

pkgbase=batticonplus
pkgname=(batticonplus batticonplus-ayatana)
_suffix=ayatana
pkgver=2.0.1
pkgrel=1
pkgdesc='Lightweight battery icon for the system tray and notifier (based on cbatticon)'
arch=(x86_64)
url='https://github.com/artist4xlibre'
license=(GPL2)
makedepends=(libayatana-appindicator)
depends=(libnotify gtk3)
source=("$pkgbase-v$pkgver.tar.gz::${url}/${pkgbase}/archive/refs/tags/v${pkgver}.tar.gz")
validpgpkeys=('4CF0F66D9CEF47105E22DD0F73580DE2EDDFA6D6')   # artist for Artix Linux
sha256sums=('a235c5fc0359d480b54a240175e5c5c69b0927fd50a848186ca101703e251d7c')

prepare() {
  cp -a "${srcdir}"/${pkgname}-${pkgver}{,-ayatana}
}

build() {
  echo "Building $pkgbase..."
  (cd ${pkgbase}-${pkgver}
    make WITH_NOTIFY=1 WITH_GTK3=1 WITH_APPINDICATOR=0
  )
  echo "Building $pkgbase-$_suffix..."
  (cd ${pkgbase}-${pkgver}-${_suffix}
    make WITH_NOTIFY=1 WITH_GTK3=1 WITH_APPINDICATOR=1
  )
}

package_batticonplus() {
  conflicts=(batticonplus-ayatana cbatticon)
  replaces=(cbatticon)
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

package_batticonplus-ayatana() {
  pkgdesc='Lightweight battery icon for the system tray, wayland version (fork of cbatticon)'
  depends+=(libayatana-appindicator)
  conflicts=(batticonplus cbatticon)
  cd ${pkgbase}-${pkgver}-${_suffix}
  make DESTDIR="${pkgdir}" install
}


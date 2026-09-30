# Maintainer: marzosh <marzosh@artixlinux.org>
# Contributor: artist for Artix Linux

pkgname=helium-browser
pkgver=0.18.2.1
_hlmver="${pkgver%.*}"
pkgrel=1
pkgdesc="Private, fast, and honest web browser based on - Ungoogled - Chromium"
arch=('x86_64')
url="https://github.com/imputnet/helium-linux"
license=('GPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'udev' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('nodejs' 'python-pillow' 'python-httplib2' 'lld'
             'gperf' 'mold' 'git' 'clang')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma')
provides=("chromium")
conflicts=("chromium")
options=('!lto')
_url_main="https://github.com/imputnet/helium"
_url_linux="https://github.com/imputnet/helium-linux"
source=("${_url_main}/archive/refs/tags/${_hlmver}.tar.gz"
        "${_url_linux}/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('044887b2a6e78390bf1f9529e24d4c7b1c22a529ffe9a9ab38722353611da612'
            '4bb35343ceaf61519419f9e2e227f0e0a17f6b003e81ab73660abbcaa0489875')

prepare() {
  mv -v "helium-${_hlmver}" helium-chromium
  mv -v helium-chromium "helium-linux-${pkgver}"
}

build() {
  cd "helium-linux-${pkgver}/scripts"
  ./build.sh -c --pgo
}

package() {
  _libfiles=(
             chrome_100_percent.pak
             chrome_200_percent.pak
             helium_crashpad_handler
             icudtl.dat
             libEGL.so
             libGLESv2.so
             libqt5_shim.so
             libqt6_shim.so
             libvk_swiftshader.so
             libvulkan.so.1
             resources.pak
             vk_swiftshader_icd.json
             v8_context_snapshot.bin
             )

  cd "helium-linux-${pkgver}/build/src/out/Default"

  install -Dm755 helium "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  install -Dm755 chromedriver "${pkgdir}/usr/bin/chromedriver"
  ln -s "/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/helium"

  install -Dm755 "${_libfiles[@]}" "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/locales" locales/*.pak
  
  install -Dm644 "${srcdir}/helium-linux-${pkgver}/package/helium.desktop" \
    "${pkgdir}/usr/share/applications/helium.desktop"

  install -Dm644 product_logo_256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/helium.png"
  install -Dm644 product_logo_256.png "${pkgdir}/usr/share/pixmaps/helium.png"
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/resources/ublock" \
    "${srcdir}/helium-linux-${pkgver}/build/src/third_party/ublock/managed_storage.json"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/helium-linux-${pkgver}/LICENSE"*
}

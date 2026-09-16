# Maintainer: marzosh <marzosh@artixlinux.org>
# Maintainer: artist for Artix Linux

pkgname=helium-browser
pkgver=0.17.0.1
_hlmver="${pkgver%.*}"
pkgrel=2
pkgdesc="Private, fast, and honest web browser based on - Ungoogled - Chromium"
arch=('x86_64')
url="https://github.com/imputnet/helium"
license=('GPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'udev' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('ninja' 'nodejs' 'python-pillow' 'python-httplib2' 'lld' 
             'gperf' 'mold' 'go' 'git' 'clang')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma')
provides=("chromium")
conflicts=("chromium")
options=('!lto')
source=("${url}/archive/refs/tags/${_hlmver}.tar.gz"
        "${url}-linux/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('5666ac55f154eaa56e206d7fb992ec5a237fd3f938b76b6873a9b4b9d023cd3c'
            'f72c58541c0a1e666b21cec147fab8f973dd658e9e89714bd424697e3021b41a')

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

# Maintainer: artist for Artix Linux

pkgname=helium-browser
pkgver=0.16.4.1
_hlmver="${pkgver%.*}"
pkgrel=1
pkgdesc="Private, fast, and honest web browser based on - Ungoogled - Chromium"
arch=('x86_64')
url="https://github.com/imputnet/helium"
license=('GPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'udev' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('ninja' 'nodejs' 'python-pillow' 'python-httplib2' 'python-pysocks'
             'python-python-socks' 'lld' 'gperf' 'mold' 'go' 'git' 'clang')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma')
provides=("chromium")
conflicts=("chromium")
options=('!lto')
source=("${url}/archive/refs/tags/${_hlmver}.tar.gz"
        "${url}-linux/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.desktop")

sha256sums=('d95295d21ed1f513516ed1148ce0f1ba63e30994a62123f83ad02b7d8963aee4'
            '99a87b0e724466ca385f9b7d46cac84cf4612141b2937232b8ba8b6768b2fe3d'
            '934b84f8f55e8461c3e47651c632d5e8e2d23ec1d71113dd7384d845ffa16a27')

prepare() {
  mv -v "helium-${_hlmver}" helium-chromium
  mv -v helium-chromium "helium-linux-${pkgver}"
}

build() {
  cd "helium-linux-${pkgver}/scripts"
  
  # Start in background
  ./build.sh -c --pgo &
  BUILD_PID=$! # store PID
  
  # Wait the problematic file gerrit_util.py be created
  while [ ! -f "../build/src/third_party/depot_tools/gerrit_util.py" ]; do
    sleep 3 # Zzz...
  done
  
  # Fix with sed...
  sed -i 's/import httplib2.socks/import socks/g' \
    "../build/src/third_party/depot_tools/gerrit_util.py"
  
  # Wait the build to finish
  wait $BUILD_PID
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

  install -Dm755 "${_libfiles[@]}" "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/locales" locales/*.pak

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 product_logo_256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 product_logo_256.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/resources/ublock" \
    "${srcdir}/helium-linux-${pkgver}/build/src/third_party/ublock/managed_storage.json"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/helium-linux-${pkgver}/LICENSE"*
}

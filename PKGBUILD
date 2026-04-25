# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>
# Contributor: Maciek Marciniak <mm2pl at kotmisia.pl>

pkgname=obs-studio
pkgver=32.1.1
pkgrel=3
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL-2.0-only')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls' 'rnnoise' 'pciutils'
         'qt6-svg' 'curl' 'jack' 'gtk-update-icon-cache' 'pipewire' 'libxcomposite'
         'libdatachannel' 'uthash' 'simde' 'qrcodegencpp-cmake' 'python' 'cef')
makedepends=('cmake' 'libfdk-aac' 'x264' 'swig' 'luajit' 'sndio' 'nlohmann-json'
             'ffnvcodec-headers' 'websocketpp' 'asio' 'extra-cmake-modules')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libva-intel-driver: hardware encoding for older Intel GPUs'
            'intel-media-driver: hardware encoding for recent Intel GPUs'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'sndio: Sndio input client'
            'v4l2loopback-dkms: virtual camera support'
            'xdg-desktop-portal-impl: Wayland window/screen capture'
            )
source=($pkgname-$pkgver.tar.gz::https://github.com/obsproject/obs-studio/releases/download/$pkgver/OBS-Studio-$pkgver-Sources.tar.gz
        obs-browser-Update-to-C-20.patch)
sha256sums=('f4c17e1aa2a00efd8729ed6cfef9308bc6a2b6c583c187d7959eaa72eb2e3676'
            '474832a156d29224eabc77bc78ca33b0e6116cb00dc2786b5869744bae8f72c3')

prepare() {
    cd $pkgname-$pkgver-sources

    # use FindCEF provided by system CEF
    rm cmake/finders/FindCEF.cmake

    # set rpath to /usr/lib/cef for obs-browser plugin
    sed -e 's|INSTALL_RPATH ".*"|INSTALL_RPATH "/usr/lib/cef/"|' -i plugins/obs-browser/cmake/os-linux.cmake

    # current CEF requires C++20
    # https://github.com/obsproject/obs-browser/pull/517
    patch -d plugins/obs-browser -Np1 -i "$srcdir/obs-browser-Update-to-C-20.patch"
}

build() {
  local _cef_api_version=$(grep -oP 'CEF_API_VERSION_LAST CEF_API_VERSION\_\K[0-9]+' /usr/include/cef/include/cef_api_versions.h)
  echo Setting CEF_API_VERSION to $_cef_api_version

  export CXXFLAGS+=" -Wno-error=deprecated-declarations"
  cmake -B build -S $pkgname-$pkgver-sources \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_BROWSER=ON \
    -DCEF_API_VERSION=$_cef_api_version \
    -DENABLE_VST=ON \
    -DENABLE_VLC=OFF \
    -DENABLE_NEW_MPEGTS_OUTPUT=OFF \
    -DENABLE_AJA=OFF \
    -DENABLE_JACK=ON \
    -DENABLE_LIBFDK=ON \
    -DENABLE_WEBRTC=ON \
    -DOBS_VERSION_OVERRIDE="$pkgver" \
    -DCALM_DEPRECATION=ON \
    -DENABLE_WEBSOCKET=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

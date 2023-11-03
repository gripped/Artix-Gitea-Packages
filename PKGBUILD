# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_name=Audacity
pkgbase=audacity
pkgname=(
  audacity
  audacity-docs
)
pkgver=3.4.0
pkgrel=1
epoch=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=(x86_64)
url="https://audacityteam.org"
license=(GPL3)
makedepends=(
  alsa-lib
  chrpath
  cmake
  ffmpeg
  flac
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  gtkmm3
  jack
  lame
  libid3tag
  libmad
  libogg
  libsbsms
  libsndfile
  libsoxr
  libvorbis
  libxkbcommon-x11
  lilv
  lv2
  mpg123
  opusfile
  portaudio
  portmidi
  portsmf
  python
  rapidjson
  soundtouch
  sqlite
  suil
  twolame
  vamp-plugin-sdk
  vst3sdk
  wavpack
  wxwidgets-gtk3
  xcb-util
  xcb-util-cursor
  xcb-util-keysyms
)
source=(
  https://github.com/audacity/audacity/archive/refs/tags/$_name-$pkgver.tar.gz
  https://github.com/$pkgbase/$pkgbase/releases/download/$_name-$pkgver/$pkgbase-manual-$pkgver.zip
)
sha512sums=('1fff66d3199591fed24a7b7a7ea3cb8b2a381c4f16d15a67949f2631a2e5ff2cac28a599b3ce28b0812de70f4984dfa51d37b3bed4e8f75deb4d5006817998d4'
            '731b13854a7cc110145aec68fe3862c57e2962ca059e5ddbb6bbd2806d4381a6520edcf54b2f9666400229da78ce39a3efd5dffa4175eb9c375d21e097cf2c60')
b2sums=('63f56548bee617dd20554cffe1ccf70f395441388273a1267bf030627787900018f58679da90807faf0fba83c3e79f9198d40a22c7a8c5cc220d80ea82181c95'
        '7c21fb78f70446a2fdd3563a2f8a7c51671882bce6b191996975c66d7b059c8a6cde0401e3fe9c12100ef4363a5c16627449ce0b8316b3b0a47117ce4da8e852')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D AUDACITY_BUILD_LEVEL=2
    -D audacity_conan_enabled=OFF
    -D audacity_has_networking=OFF
    -D audacity_has_crashreports=OFF
    -D audacity_has_updates_check=OFF
    -D audacity_has_sentry_reporting=OFF
    -D audacity_lib_preference=system
    -D audacity_obey_system_dependencies=ON
    -D audacity_use_vst3sdk=system
    -S $pkgname-$_name-$pkgver
    -W no-dev
  )

  export VST3SDK='/usr/src/vst3sdk'
  export CFLAGS+=" -DNDEBUG"
  export CXXFLAGS+=" -DNDEBUG"
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package_audacity() {
  license+=(BSD)
  groups=(pro-audio)
  depends=(
    alsa-lib libasound.so
    expat
    flac libFLAC.so libFLAC++.so
    gcc-libs
    glibc
    gdk-pixbuf2 libgdk_pixbuf-2.0.so
    glib2 libglib-2.0.so libgobject-2.0.so
    gtk3 libgdk-3.so libgtk-3.so
    hicolor-icon-theme
    jack  # likely dlopen'ed
    lame  # likely dlopen'ed
    libid3tag libid3tag.so
    libmad
    libogg libogg.so
    libsbsms libsbsms.so
    libsndfile libsndfile.so
    libsoxr
    libvorbis libvorbis.so libvorbisenc.so libvorbisfile.so
    libx11
    lilv liblilv-0.so
    mpg123 libmpg123.so
    opusfile
    portaudio libportaudio.so
    portmidi libportmidi.so
    portsmf libportSMF.so
    python
    rapidjson
    soundtouch
    sqlite libsqlite3.so
    suil libsuil-0.so
    twolame libtwolame.so
    util-linux-libs
    wxwidgets-gtk3
    vamp-plugin-sdk libvamp-hostsdk.so
    wavpack
    wxwidgets-common
  )
  optdepends=(
    'audacity-docs: for documentation'
    'ffmpeg: for additional import/export capabilities'
  )
  provides=(
    ladspa-host
    lv2-host
    vamp-host
    vst-host
    vst3-host
  )


  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$_name-$pkgver/lib-src/libnyquist/nyquist/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.nyquist"
}

package_audacity-docs() {
  license+=(CCPL)
  pkgdesc+=" - documentation"

  install -vdm 755 "$pkgdir/usr/share/doc/$pkgbase/html/"
  cp -av $pkgbase-manual-$pkgver/* "$pkgdir/usr/share/doc/$pkgbase/html/"
}

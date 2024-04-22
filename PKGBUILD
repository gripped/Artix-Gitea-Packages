# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_name=Audacity
pkgbase=audacity
pkgname=(
  audacity
  audacity-docs
)
pkgver=3.5.0
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
  catch2-v2
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
  https://github.com/$pkgbase/$pkgbase/releases/download/$_name-$pkgver/$pkgbase-manual-$pkgver.tar.gz
  audacity_3_4_2_enable_tests_without_conan.patch
)
sha512sums=('319b9e578f7461fe34f4ae47041f5c20c2b87eb57ad493930991add0d98372f56c829526ccfe6ee629a00ebc77e447f54069a861ed954c8260dc8eb3f32188c8'
            '763999e709c339ed3b2f53e2260cf1e9adce6fc7e0452e6c21fd5b6e9301733d0a84688827efcbdde1b5d12dcb82766a8db95b73c74d5aaf83163f35dc43b466'
            'ab92475e599fd4345d33a7ae6cd47231ab614b92ca9a71e732a073b31ec18ad92f3d1384183b0821e75b4ba1bb4987c5369c1398604d6c4ea01a20f94fb7b976')
b2sums=('91f1e537336fe2d4700bd1e3ec49cd0081b3d05aeeea759cba5bd62d0658c73d307739cab04a1fca69cb62edb15a48c1a079b21713f325efd2354960bee49d76'
        '2bc57b2791c1a66f7bdd6cd8509b356b8aea03e0ac703f1581f4520e51e604748c08635a05690f5878124d5dfbb27bbab7e77e36edbc04101ef55e15ba6d7936'
        '0c176336ca8df12f443e6935e8293afa3408e0e7b6a290417007bbbc0500c8eb8716ae3265665a80d85d689f9b369e5edf7986e8507288af77e8eea4ebedd624')

prepare() {
    cd "$pkgname-$_name-$pkgver"
    # https://github.com/audacity/audacity/discussions/5841#discussioncomment-8138725
    patch --forward --strip=1 --input="${srcdir}/audacity_3_4_2_enable_tests_without_conan.patch"
}

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
    -D audacity_has_tests=ON
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
  # disable two tests which do not work without an alsa/jack instance
  ctest --test-dir build --output-on-failure --exclude-regex "lib-stretching-sequence|journal_sanity"
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
  cp -av help/manual/* "$pkgdir/usr/share/doc/$pkgbase/html/"
}

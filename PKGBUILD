# Maintainers: Ckat <ckat@teknik.io>, mj3ww2ypcj8f

pkgname=sneedacity
pkgver=3.0.2.r344.1
pkgrel=5
pkgdesc="Feed and seed digital audio waveforms, without telemetry (formely Audacity)"
arch=(i686 x86_64)
url="https://github.com/Sneeds-Feed-and-Seed/sneedacity"
license=(GPL2 CCPL)
groups=(sneed-suite)
depends=(alsa-lib libx11 gtk3 expat libid3tag libogg libsndfile jack ffmpeg
         libvorbis lilv lv2 portsmf suil libmad twolame vamp-plugin-sdk libsoxr soundtouch)
makedepends=(git cmake sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs jack nasm)
# can't find system lame portmidi
optdepends=('ffmpeg: additional import/export capabilities')
provides=(audacity sneedacity)
conflicts=(audacity sneedacity-bin)
install=${pkgname}.install
source=(
  "git+https://github.com/Sneeds-Feed-and-Seed/sneedacity.git"
  "sneedacity.patch"
)
sha256sums=('SKIP'
            '6a1e16d7fd72cfffed920fb8318ddc1d544fcde4c4a23811cef807d4058f1b64')

#pkgver() {
#  cd sneedacity
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
#}

build() {
  mkdir sneedacity/build
  cd sneedacity/build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxBUILD_TOOLKIT:STRING=gtk3 \
    -Dsneedacity_use_wxwidgets=local \
    sneedacity_use_ffmpeg:STRING=loaded \
    ..
  cmake --build . -j6
}

package() {
#  mkdir -p ${pkgdir}/etc/ld.so.conf.d
#  echo '/usr/lib/sneedacity' >${pkgdir}/etc/ld.so.conf.d/sneedacity.conf
  cd sneedacity/build
  make DESTDIR="${pkgdir}" install
}

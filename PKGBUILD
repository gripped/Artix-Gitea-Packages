# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

pkgname=mpv
epoch=1
_tag='807b9343ef911d138950411cdb83c16a151d2018' # git rev-parse v${pkgver}
pkgver=0.37.0
pkgrel=2.1
pkgdesc='a free, open source, and cross-platform media player'
arch=('x86_64')
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
url='https://mpv.io/'
depends=('alsa-lib' 'libasound.so' 'desktop-file-utils' 'ffmpeg' 'libavcodec.so' 'libavdevice.so'
         'libavfilter.so' 'libavformat.so' 'libavutil.so' 'libswresample.so' 'libswscale.so'
         'glibc' 'hicolor-icon-theme' 'jack' 'libjack.so' 'lcms2' 'liblcms2.so' 'libarchive'
         'libarchive.so' 'libass' 'libass.so' 'libbluray' 'libbluray.so' 'libcdio'
         'libcdio-paranoia' 'libdrm' 'libdvdnav' 'libdvdread' 'libegl' 'libgl' 'libglvnd'
         'libjpeg' 'libjpeg.so' 'libplacebo' 'libplacebo.so' 'libpulse' 'libpulse.so' 'libsixel'
         'libva' 'libva.so' 'libva-drm.so' 'libva-wayland.so' 'libva-x11.so' 'libvdpau' 'libx11'
         'libxext' 'libxkbcommon' 'libxkbcommon.so' 'libxpresent' 'libxrandr' 'libxss'
         'libxv' 'luajit' 'mesa' 'mujs' 'libpipewire' 'rubberband' 'librubberband.so' 'shaderc'
         'libshaderc_shared.so' 'openal' 'uchardet' 'vapoursynth' 'vulkan-icd-loader' 'wayland' 'zlib')
makedepends=('git' 'meson' 'python-docutils' 'ladspa' 'wayland-protocols'
             'ffnvcodec-headers' 'vulkan-headers')
optdepends=('yt-dlp: for video-sharing websites playback'
            'youtube-dl: for video-sharing websites playback')
provides=('libmpv.so')
options=('!emptydirs')
validpgpkeys=('145077D82501AA20152CACCE8D769208D5E31419') # sfan5 <sfan5@live.de>
source=("git+https://github.com/mpv-player/mpv.git#tag=${_tag}?signed")
sha256sums=('SKIP')

prepare() {
  cd mpv

  # misc fixes
  git cherry-pick -n 5cc810e7f84256bb606bc8fe0514238af98bc191
  git cherry-pick -n 6d1383383b29c8968a7df02d3be808795b1f10d3
  git cherry-pick -n 0f2370476b4279040261878c601fb8015a8502d7
  git cherry-pick -n 99d387bbc81e36f60da26d63b96736e2461bcd2e
  git cherry-pick -n 289b3a432e010a155efbe255575abf16db3d1b71
  git cherry-pick -n 26a51464b68ce2571bdbe538da9c0a1c255b879f
  git cherry-pick -n b23e8b2ffb64e315b480f1b10d1a4feb3154f3e2
  git cherry-pick -n 531868fe0d2a35fbbff78d9a9ff8f96df73e69fd

  # https://github.com/mpv-player/mpv/issues/13077
  git cherry-pick -n 9e27b1f523071db184443d78f7144cb599dd0829

  # https://github.com/mpv-player/mpv/issues/13092
  git cherry-pick -n cadb68487e9c8f4237ba59b672180ad1460db514

  # https://github.com/mpv-player/mpv/issues/13106
  git cherry-pick -n d8a0808de5be51dbcb2ebafcf723d0de46bcae33
  git cherry-pick -n 054dde0424dd657a6426ce6ba50debccf6ba99cb

  # https://github.com/mpv-player/mpv/issues/13176
  git cherry-pick -n 02533e592827a1ec9ddf2433b7f87c5f72b75281
  git cherry-pick -n bd35dc8ce71941b6bbd0839570ad0e66b0a85d3d

  # https://github.com/mpv-player/mpv/issues/13148
  git cherry-pick -n 700f72f8e424486633b1c8da9313182e63072592
  git cherry-pick -n 7f595aabf45fd60d080ab80ccdc8def26cfbd2ec

  # https://github.com/mpv-player/mpv/issues/13376
  git cherry-pick -n adcc6794b5d984f41ec429ef33e702fecde9b4f7
}

build() {
  local _meson_options=(
    --auto-features auto

    -Dlibmpv=true

    -Dcaca=disabled
    -Dcdda=enabled
    -Ddvbin=enabled
    -Ddvdnav=enabled
    -Dlibarchive=enabled
    -Dopenal=enabled
  )

  artix-meson "${pkgname}" build "${_meson_options[@]}"

  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  # delete private entries only required for static linking 
  sed -i -e '/Requires.private/d' -e '/Libs.private/d' "${pkgdir}"/usr/lib/pkgconfig/mpv.pc

  install -m0644 "${pkgname}"/DOCS/{encoding.rst,tech-overview.txt} \
    "${pkgdir}"/usr/share/doc/mpv

  install -m0644 "${pkgname}"/TOOLS/{umpv,mpv_identify.sh,stats-conv.py,idet.sh,lua/*} \
    -D -t "${pkgdir}"/usr/share/mpv/scripts
}

# Maintainer: artist for Artix Linux

pkgname=efl
pkgver=1.28.1
pkgrel=3
pkgdesc="Enlightenment Foundation Libraries"
arch=('x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'MIT' 'custom')
depends=('curl' 'fontconfig' 'fribidi' 'harfbuzz'
         'gst-plugins-base-libs' 'luajit' 'lua52' 'libgl' 'libinput'
         'libpulse' 'libsndfile' 'libspectre' 'libraw' 'librsvg' 'libwebp'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxkbcommon' 'libxrandr'
         'libxss' 'libunwind' 'mesa' 'poppler' 'openjpeg2' 'libjpeg-turbo'
         'libpng' 'libtiff' 'giflib' 'lz4' 'zlib' 'libelogind' 'udev' 'openssl'
         'glibc' 'libutil-linux' 'dbus' 'shared-mime-info' 'mailcap'
         'ttf-font' 'scim' 'wayland' 'libxkbcommon-x11'
         'libavif' 'libheif' 'libjxl' 'rlottie')
makedepends=('git' 'meson' 'ninja' 'gcc' 'binutils' 'procps-ng' 'wayland-protocols' 'pulseaudio' 'doxygen')
optdepends=('gst-plugins-base: Video and thumbnail codecs'
            'gst-plugins-good: Video and thumbnail codecs'
            'gst-plugins-bad: Video and thumbnail codecs'
            'gst-plugins-ugly: Video and thumbnail codecs'
            'gst-libav: Video and thumbnails with ffmpeg/libav'
            'libraw: RAW image loader'
            'libreoffice: Office document loader'
            'librsvg: SVG loader'
            'libspectre: PostScript loader'
            'poppler: PDF loader'
            'scim: IM module for SCIM')
options=('!emptydirs')
source=("https://download.enlightenment.org/rel/libs/${pkgname}/$pkgname-$pkgver.tar.xz"
        "moksha-artix::git+https://gitea.artixlinux.org/artix/moksha-artix.git")
sha256sums=('84cf6145f9cc82bfff690005be24392c8f3c52f8e00ff04d8eea371429c09424'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CFLAGS="$CFLAGS -fvisibility=hidden"
  export CXXFLAGS="$CXXFLAGS -fvisibility=hidden"

  if [ -d build ]; then
    rm -rf build
  fi
  mkdir -p build

  meson setup --prefix=/usr --buildtype=release \
    -Dc_std=gnu99 \
    -Dpulseaudio=true \
    -Dglib=true \
    -Dsystemd=false \
    -Dnetwork-backend=connman \
    -Dfb=true \
    -Ddrm=true \
    -Dwl=true \
    -Dlua-interpreter=lua \
    -Dbindings= \
    -Dbuild-tests=false \
    -Dbuild-examples=false \
    -Ddocs=true \
    . build

  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 -t "$pkgdir/usr/share/elementary/config/standard/" "$srcdir/moksha-artix/defaults/base.cfg"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COMPLIANCE COPYING
}


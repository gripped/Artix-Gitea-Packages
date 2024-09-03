# Maintainer: artist for Artix Linux

pkgname=efl
pkgver=1.27.0
pkgrel=4
_commit="248d62bf5e13ca8800a73b6cf3e8759443468282"
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
optdepends=('pulseaudio: Pulse Audio'
            'gst-plugins-base: Video and thumbnail codecs'
            'gst-plugins-good: Video and thumbnail codecs'
            'gst-plugins-bad: Video and thumbnail codecs'
            'gst-plugins-ugly: Video and thumbnail codecs'
            'gst-libav: Video and thumbnails with ffmpeg/libav'
            'libreoffice: Office document thumbnails')
source=("git+https://git.enlightenment.org/enlightenment/$pkgname.git#commit=$_commit"
        "git+https://gitea.artixlinux.org/artix/moksha-artix.git")
sha256sums=('bb70b7c1c92e150a6676199ede30f74c13b61bc6c59bfa8924ae345085baf7cf'
            'SKIP')

build() {
  cd $pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"
  export CXXFLAGS="$CXXFLAGS -fvisibility=hidden"

  meson setup --prefix=/usr --buildtype=release \
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
  cd $pkgname

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 -t "$pkgdir/usr/share/elementary/config/standard/" "$srcdir/moksha-artix/defaults/base.cfg"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COMPLIANCE COPYING
}


# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=snes9x
pkgname=(
  snes9x
  snes9x-gtk
)
pkgver=1.63
pkgrel=1
pkgdesc='Portable Super Nintendo Entertainment System (TM) emulator'
arch=(x86_64)
url=http://www.snes9x.com/
license=(custom)
makedepends=(
  alsa-lib
  cairo
  clang
  cmake
  gdk-pixbuf2
  git
  glib2
  glslang
  gtk3
  gtkmm3
  intltool
  libepoxy
  libpng
  libpulse
  libx11
  libxext
  libxml2
  libxrandr
  libxv
  minizip
  nasm
  ninja
  portaudio
  python
  sdl2
  zlib
)
_tag=e53e2b43e6cd83ba98d77478955f547cbf1eab14
source=(
  git+https://github.com/snes9xgit/snes9x.git#tag=${_tag}
  git+https://github.com/KhronosGroup/glslang.git
  git+https://github.com/KhronosGroup/SPIRV-Cross.git
  git+https://github.com/KhronosGroup/Vulkan-Headers.git
)
b2sums=('56819bc7c717701e816fa765fb065f21cf5909b065f6e02f2cf2c6f2419ca63c87c2935858c9db6181873a94fda5f73b6826380ee21d7448bfe19d537368b3f7'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd snes9x
  for submodule in external/{glslang,SPIRV-Cross}; do
    git submodule init ${submodule}
    git config submodule.shaders/${submodule#*/}.url ../${submodule#*/}
    git -c protocol.file.allow=always submodule update ${submodule}
  done
  git submodule init external/vulkan-headers
  git config submodule.external/Vulkan-headers.url ../Vulkan-Headers
  git -c protocol.file.allow=always submodule update external/vulkan-headers
  cd unix
  autoreconf -fiv
}

build() {
  export CC=clang
  export CXX=clang++
  export CFLAGS+=' -Wno-format-security'
  export CXXFLAGS+=' -Wno-format-security'
  pushd snes9x/unix
  ./configure \
    --prefix='/usr' \
    --enable-netplay
  make
  popd
  cmake -S snes9x/gtk -B build build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package_snes9x() {
  depends=(
    alsa-lib
    libpng
    libx11
    libxext
    libxinerama
    libxv
    minizip
    zlib
  )

  install -Dm 755 snes9x/unix/snes9x -t "${pkgdir}"/usr/bin/
  install -Dm 644 snes9x/docs/{control-inputs.txt,controls.txt,snapshots.txt} -t "${pkgdir}"/usr/share/doc/snes9x
  install -Dm 644 snes9x/LICENSE "${pkgdir}"/usr/share/licenses/snes9x/LICENSE
}

package_snes9x-gtk() {
  depends=(
    alsa-lib
    cairo
    gdk-pixbuf2
    glib2
    gtk3
    gtkmm3
    hicolor-icon-theme
    libepoxy
    libpng
    libpulse
    libx11
    libxext
    libxml2
    libxrandr
    libxv
    minizip
    portaudio
    sdl2
    zlib
  )

  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 snes9x/docs/{control-inputs.txt,controls.txt,snapshots.txt} -t "${pkgdir}"/usr/share/doc/snes9x-gtk
  install -Dm 644 snes9x/LICENSE "${pkgdir}"/usr/share/licenses/snes9x-gtk/LICENSE
}

# vim: ts=2 sw=2 et:

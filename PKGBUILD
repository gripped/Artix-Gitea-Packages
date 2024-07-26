# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=opensubdiv
pkgver=3.6.0
pkgrel=1
pkgdesc="An Open-Source subdivision surface library"
arch=(x86_64)
url="http://graphics.pixar.com/opensubdiv"
license=('APACHE')
depends=('ptex' 'intel-tbb' 'libxcursor' 'xorg-xrandr' 'libxinerama' 'libxi')
makedepends=('cmake' 'doxygen' 'glfw' 'glew' 'python' 'python-pygments' 'python-docutils' 'opencl-headers' 'libglvnd')
source=("https://github.com/PixarAnimationStudios/OpenSubdiv/archive/v${pkgver//./_}.tar.gz")
sha512sums=('a976733a26e2c0f6510f59d4372b1b33f5404a9d536bcbd6ae3a1a0ffd1bba5495df7108bebc854d5c069575772c97c0d00f0f16f79e87611376ba84e9ae7a4b')
options=(!lto)

build() {
  cd "OpenSubdiv-${pkgver//./_}"

  cmake \
      -Bbuild \
      -DNO_EXAMPLES=ON \
      -DNO_REGRESSION=ON \
      -DNO_TUTORIALS=ON \
      -DNO_CUDA=ON \
      -DCMAKE_INSTALL_PREFIX=/usr

  make -C build
}

package() {
  cd "OpenSubdiv-${pkgver//./_}"

  DESTDIR="$pkgdir/" make -C build install
}

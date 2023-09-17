# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jo Christian Bergskås <jcberg@gmail.com>

pkgname=fceux
pkgver=2.6.6
pkgrel=1
pkgdesc='Fast and ultra-compatible NES/Famicom emulator'
arch=(x86_64)
url='https://github.com/TASEmulators/fceux'
license=(GPL)
depends=(gd lua minizip qt5-base sdl2)
makedepends=(cmake git glu mesa-libgl ninja setconf scons)
optdepends=('ffmpeg: for recording')
source=("$pkgname-$pkgver::git+$url#commit=34eb7601c415b81901fd02afbd5cfdc84b5047ac") # tag: v2.6.6
b2sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/-interim git//g' src/version.h
  setconf scripts/genGitHdr.sh GIT_URL "'""${source:4:34}""'"
  setconf scripts/genGitHdr.sh GIT_REV "${source#*=}"
}

build() {
  artix-cmake \
    -B build \
    -D CMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -fPIC -w" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -S $pkgname-$pkgver
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r $pkgname-$pkgver/documentation/* "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 $pkgname-$pkgver/changelog.txt \
    "$pkgdir/usr/share/doc/$pkgname/changelog.txt"
}

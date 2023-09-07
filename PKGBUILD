# Contributor: yaroslav <proninyaroslav@mail.ru>
# Contributor: Askhat Bakarov <sirocco{at}ngs{dot}ru>

pkgname=android-file-transfer
pkgver=4.2
pkgrel=3.1
pkgdesc='Android MTP client with minimalistic UI'
arch=(x86_64)
url='https://whoozle.github.io/android-file-transfer-linux'
license=(GPL3)
depends=(qt5-base fuse2 libxkbcommon-x11 hicolor-icon-theme file)
makedepends=(cmake qt5-tools git)
#source=(android-file-transfer-$pkgver.tar.gz::https://github.com/whoozle/android-file-transfer-linux/archive/v$pkgver.tar.gz)
#source=("git+https://github.com/whoozle/android-file-transfer-linux.git#commit=e8f45ff6f02d2e1e09c12f3aa708e87548d4f2bd")
source=("git+https://github.com/whoozle/android-file-transfer-linux.git")
sha256sums=('SKIP')

build() {
  cd android-file-transfer-linux
  cmake -DCMAKE_INSTALL_PREFIX=/usr . -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
  make
}

package() {
  cd android-file-transfer-linux
  make DESTDIR="$pkgdir/" install
}

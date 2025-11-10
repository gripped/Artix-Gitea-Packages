# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=libqtxdg
pkgver=4.3.0
pkgrel=1
pkgdesc="Library providing freedesktop.org XDG specs implementations for Qt"
arch=("x86_64")
url="https://github.com/lxqt/$pkgname"
license=("LGPL" "custom")
depends=("qt6-base" "qt6-svg")
makedepends=("cmake" "lxqt-build-tools")
checkdepends=("xorg-server-xvfb")
optdepends=(
  'xterm: the default terminal for running .desktop files'
)
provides=("libQt6Xdg.so" "libQt6XdgIconLoader.so")
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz.asc"
   qt-6.10.patch
)
sha256sums=('846cb8a35ab55ea3d513a860b6bb5fdf45e2de95a037afb73538b316908efa55'
            'SKIP'
            '4f83fe973c705e5440a8077b65cc814703674bc56f7d96d08d4303680e42a328')
validpgpkeys=(
  "169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
  "7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../qt-6.10.patch
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON
  make
}

check() {
  cd build

  xvfb-run --auto-display make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname-$pkgver"/{AUTHORS,COPYING,Digia-Qt-LGPL-Exception-1.1} \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}

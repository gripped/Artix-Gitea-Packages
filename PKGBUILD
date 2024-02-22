# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=squashfuse
pkgver=0.5.1
pkgrel=1
pkgdesc="FUSE filesystem to mount squashfs archives"
arch=(x86_64)
url="https://github.com/vasi/squashfuse"
license=(LicenseRef-squashfuse)
depends=(fuse
         glibc
         lz4
         zlib
         zstd
         xz)
makedepends=()
source=(https://github.com/vasi/squashfuse/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c2cdaea87cc9b21536badf49d34ea691b508eb1825b2b628dbe5a7cca596b257')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool # Fix overlinking
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

# install missing headers
  install -Dm644 *.h -t "$pkgdir"/usr/include/squashfuse
}

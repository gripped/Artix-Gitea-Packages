# Maintainer: Sébastien Luttringer
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=iperf
pkgver=2.2.0
pkgrel=1
pkgdesc='A tool to measure maximum TCP bandwidth'
arch=('x86_64')
license=('custom')
url='https://sourceforge.net/projects/iperf2/'
depends=('glibc' 'gcc-libs')
source=("https://downloads.sourceforge.net/iperf2/iperf-$pkgver.tar.gz")
sha256sums=('16810a9575e4c6dd65e4a18ab5df3cdac6730b3c832cf080a8990f132f68364a')
prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  :
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-ipv6 \
              --enable-multicast \
              --enable-threads \
              --enable-fastsampling
  make
}

package() {
  pushd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/iperf/LICENSE"
  popd
}

# vim:set ts=2 sw=2 et:

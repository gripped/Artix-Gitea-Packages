# Maintainer: Sébastien Luttringer
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=iperf
pkgver=2.2.1
pkgrel=1
pkgdesc='A tool to measure maximum TCP bandwidth'
arch=('x86_64')
license=('LicenseRef-IPerf')
url='https://sourceforge.net/projects/iperf2/'
depends=('glibc' 'gcc-libs')
source=("https://downloads.sourceforge.net/iperf2/iperf-$pkgver.tar.gz")
sha256sums=('754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc536b61b51fefbd8fb')

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

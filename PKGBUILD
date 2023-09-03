# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=alsa-ucm-conf
pkgver=1.2.10
pkgrel=1
pkgdesc="ALSA Use Case Manager configuration (and topologies)"
arch=(any)
url="https://alsa-project.org/"
license=(BSD)
source=(https://www.alsa-project.org/files/pub/lib/$pkgname-$pkgver.tar.bz2{,.sig})
sha512sums=('172956a2c127e9afa5be9c6ada43bfa9fda825823f8f6acbe252edef3381afe3adfa3299c1419f04375599be7721a551c6800be99db44b091611aeb824ffcd72'
            'SKIP')
b2sums=('215842f1f59c2dea5e3f3fe880dc49d6263998746a50c2591b8a9786ead3afae2c713e179ff6e8caa518b3a8516a1b031872c1fad2a17fbd3afbb0390a803693'
        'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

package() {
  cd $pkgname-$pkgver
  install -vdm 755 "$pkgdir/usr/share/alsa/"
  cp -av ucm2 "$pkgdir/usr/share/alsa/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 ucm2/README.md -t "$pkgdir/usr/share/doc/$pkgname/ucm2"
}

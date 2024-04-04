# Maintainer: Sébastien Luttringer
# Contributor: nous

pkgname=archivetools
pkgver=3
pkgrel=3.2
pkgdesc='Artix Linux Archive Tools'
arch=('any')
url='https://gitea.artixlinux.org/nous/archivetools'
license=('GPL2')
depends=('rsync' 'hardlink' 'xz' 'util-linux' 'python' 'python-libarchive-c')
makedepends=('git')
backup=('etc/archive.conf')
provides=('archivetools')
conflicts=('archivetools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('SKIP')

package() {
  cd $pkgname
  install -Dm644 archive.conf "$pkgdir/etc/archive.conf"
  install -Dm755 archive.sh "$pkgdir/usr/bin/archive"
  install -Dm755 archive-cleaner -t "$pkgdir/usr/bin"
  install -Dm755 archive-compact.sh -t "$pkgdir/usr/bin"

  install -Dm644 archive.sysusers "$pkgdir/usr/lib/sysusers.d/archive.conf"
  install -Dm644 archive.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/archive.conf"
}

# vim:set ts=2 sw=2 et:

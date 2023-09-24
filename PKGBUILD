# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>

pkgname=man-db
pkgver=2.12.0
pkgrel=1
pkgdesc="A utility for reading man pages"
arch=('x86_64')
url="https://gitlab.com/man-db/man-db"
license=('GPL' 'LGPL')
depends=( 'bash' 'gdbm' 'zlib' 'groff' 'libpipeline' 'less' 'libseccomp' 'glibc')
makedepends=('po4a')
optdepends=('gzip') # covered by virtual "base" package
backup=('etc/man_db.conf')
conflicts=('man')
provides=('man')
replaces=('man')
install=${pkgname}.install
source=(https://savannah.nongnu.org/download/man-db/$pkgname-$pkgver.tar.xz{,.asc}
        # fallback should be used within first 24h after a release
        #https://download-mirror.savannah.gnu.org/releases/man-db/$pkgname-$pkgver.tar.xz{,.asc} 
        convert-mans
)
validpgpkeys=('AC0A4FF12611B6FCCF01C111393587D97D86500B') # Colin Watson <cjwatson@debian.org>
sha512sums=('4b644a508cf10ef6d27b6325b08f8a89e0695bbc1409bf420efd27649c6851860cc472c4d86063f7b71dccd01fb158faa82afa1e2b91c9a20154acf66b0349bf'
            'SKIP'
            '0b159285da20008f0fc0afb21f1eaebd39e8df5b0594880aa0e8a913b656608b8d16bb8d279d9e62d7aae52f62cb9b2fc49e237c6711f4a5170972b38d345535')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --with-systemdsystemunitdir=no \
    --with-snapdir=/var/lib/snapd/snap \
    --with-db=gdbm \
    --disable-setuid \
    --enable-cache-owner=root \
    --enable-mandirs=GNU \
    --with-sections="1 1p n l 8 3 3p 0 0p 2 3type 5 4 9 6 7"
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  # part of groff pkg
  rm -f ${pkgdir}/usr/bin/zsoelim

  # script from LFS to convert manpages, see
  # http://www.linuxfromscratch.org/lfs/view/6.4/chapter06/man-db.html
  install -D -m755 ${srcdir}/convert-mans  ${pkgdir}/usr/bin/convert-mans
}

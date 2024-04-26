# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=ed
pkgver=1.20.2
pkgrel=1
pkgdesc="A POSIX-compliant line-oriented text editor"
arch=('x86_64')
license=('GPL')
url="https://www.gnu.org/software/ed/ed.html"
depends=('glibc' 'sh')
options=('!emptydirs')
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742')  # Antonio Diaz Diaz
source=("https://ftp.gnu.org/gnu/ed/$pkgname-$pkgver.tar.lz"{,.sig})
sha256sums=('65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523'
            'SKIP')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/ \
              --bindir=/usr/bin \
              --mandir=/usr/share/man \
              --infodir=/usr/share/info \
              "CPPFLAGS=$CPPFLAGS" \
              "CFLAGS=$CFLAGS" \
              "LDFLAGS=$LDFLAGS"

  make
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" "DESTDIR=$pkgdir" install
}

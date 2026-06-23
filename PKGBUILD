# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=editline
pkgver=2.0.0
pkgrel=1
pkgdesc='A readline() replacement for UNIX without termcap (ncurses)'
arch=('x86_64')
url='http://troglobit.com/editline.html'
license=(Spencer-94)
depends=(glibc)
makedepends=(git)
provides=(libeditline.so)
install="$pkgname.install"
source=("$pkgname::git+https://github.com/troglobit/editline#tag=$pkgver")
sha512sums=('3fc6d415cfba1282154f0e570ecc25453e95d94237e729d4bf4a52e5f02848a694d0848d426579f0589b0bc0fe620fdeec871ac5ff5812d5f3606c333545d618')
b2sums=('9aaf061c9d0fa5caa007f887b1378268035c551e178ab5960826dceb822acb04963d871c9ff49b068fb88884cb78273110b05005af78317052df948a859dd34e')

build () {
  cd "$pkgname"

  ./autogen.sh

  ./configure --prefix=/usr

  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  
  # avoid libedit conflict
  mv "$pkgdir"/usr/share/man/man3/editline{,-troglobit}.3

  # license
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # additional documentation
  cp -vrt "$pkgdir/usr/share/doc/$pkgname" docs
}

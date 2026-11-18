# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan
pkgver=0.5.2
pkgrel=1
pkgdesc='A text-mode web browser and pager for Unix-like systems'
arch=(x86_64)
url='https://chawan.net/'
license=(Unlicense)
depends=(
  glibc
  brotli
  libssh2
  openssl
  sh
)
makedepends=(git 'nim>=2.0.0')
source=("$pkgname::git+https://git.sr.ht/~bptato/chawan#tag=v$pkgver")
sha512sums=('32c4a99eeae40e263d6a11a5ad3eeb949101ea74dacd261d31bc29e584e09c79e28c7ea0758879e5cced32622d1503b57e3a4dedb805304f0f4943810923dcec')
b2sums=('5c0863f3df31fa85c8fa95285575e8301ffa1b77827b3e300d300bc9bb0d443a1600838612d02e2814438e1c2074573732945031be263dc05169784ba49a9090')

build() {
  cd "$pkgname"

  export CFLAGS+=" -ffile-prefix-map=$srcdir/="

  make LIBEXECDIR=/usr/lib/chawan
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX='/usr' LIBEXECDIR="$pkgdir/usr/lib/chawan" install
}

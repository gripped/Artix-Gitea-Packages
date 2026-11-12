# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
pkgname=libnbd
pkgver=1.24.4
pkgrel=1
pkgdesc="NBD client library in userspace"
arch=('x86_64')
url="https://gitlab.com/nbdkit/libnbd"
license=('LGPL-2.1-or-later')
depends=('glibc' 'gnutls' 'libxml2')
makedepends=('perl' 'ocamlbuild' 'ocaml-findlib' 'rust' 'fuse3' 'python' 'go')
optdepends=(
  'fuse3: For nbdfuse support'
  'ocaml: For OCaml bindings'
  'python>=3: For Python bindings'
)
source=(
  "https://download.libguestfs.org/libnbd/${pkgver%.*}-stable/libnbd-${pkgver}.tar.gz"{,.sig}
  tokio-fix.patch::https://gitlab.com/nbdkit/libnbd/-/commit/ccc9e8f8b7c651fb36001c532256c2a1955f4a6f.patch
)
sha256sums=('19dc521f2b8142ecd45d3009e191b60b76105b1c522b03ce0582adf74864b83b'
            'SKIP'
            '2317b2ef9677667063a5191859c32318a9cab640eebabb521c4999cc01e1eef3')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')  # Richard W.M. Jones <rjones@redhat.com>

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i ../tokio-fix.patch
  autoreconf -fiv
}

build() {
  cd "${pkgname}-${pkgver}"
  export CFLAGS+=" -ffat-lto-objects"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

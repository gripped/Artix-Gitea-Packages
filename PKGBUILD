# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Pavel Borzenkov <pavel@voidptr.ru>
# Contributor: aksr <aksr at t-com dot me>

pkgname=criu
pkgver=4.3
pkgrel=1
pkgdesc='Utilities to checkpoint and restore processes in userspace'
arch=(x86_64)
url='https://criu.org'
license=(
  GPL-2.0-only
  LGPL-2.1-only
)
depends=(
  glibc
  gnutls
  libbpf
  libbsd
  libdrm
  libgcc
  libnet
  libnl
  nftables
  protobuf-c
  python
  python-protobuf
  util-linux-libs
)
makedepends=(
  asciidoc
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
  xmlto
)
# Cant run tests (only unit tests) due to privilege escalation required.
# https://github.com/checkpoint-restore/criu/issues/434
# checkdepends=(
#   libaio
#   python-yaml
# )
provides=(
  libcompel.so
  libcriu.so
)
options=(!lto)
source=("git+https://github.com/checkpoint-restore/criu#tag=v$pkgver")
sha512sums=('6a066a4ee9fbd5e741131c8927f168ae56c4a82f792d50589fda918610476139a491015e2685d7680a61f079bb582d6c0ddc57792e6fc162c2777781081a3782')
b2sums=('d7f6bca3535374532cab7c8cfaa1699d2dbafc62cd08590bbbf6f1e916363a2eaae9fea5550a1660f2f4e231f1aa2ec7887338029586c5dd9ebb17b0f6440a44')

build() {
  cd "$pkgname"
  # shellcheck disable=SC2001
  export CFLAGS=$(echo "$CFLAGS" | sed 's/-Wp,-D_FORTIFY_SOURCE=[0-9]//g')
  make criu crit amdgpu_plugin docs
  python -m build --wheel --no-isolation crit
  python -m build --wheel --no-isolation --skip-dependency-check lib
}

check() {
  cd "$pkgname"
  make unittest
  # make test
}

package() {
  cd "$pkgname"
  make \
    DESTDIR="$pkgdir" \
    PREFIX=/usr \
    SBINDIR=/usr/bin \
    LIBDIR=/usr/lib \
    LIBEXECDIR=/usr/lib \
    install
  python -m installer --destdir="$pkgdir" crit/dist/*.whl
  python -m installer --destdir="$pkgdir" lib/dist/*.whl
  # Remove empty directory to silence namcap warning.
  rm -vr "$pkgdir/usr/include/compel/common/asm"
}

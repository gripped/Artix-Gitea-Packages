# Maintainer:
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=tpm2-tools
pkgver=5.5
pkgrel=1
pkgdesc='Trusted Platform Module 2.0 tools based on tpm2-tss'
arch=(x86_64)
url='https://github.com/tpm2-software/tpm2-tools'
license=(BSD-3-Clause)
depends=(
  glibc
)
makedepends=(
  curl
  openssl
  tpm2-tss
)
checkdepends=(
  cmocka
  expect
  iproute2
  python-yaml
  swtpm
  tpm2-abrmd
  util-linux-libs
  xxd
)
optdepends=('tpm2-abrmd: user space resource manager')
options=(!lto)
source=($url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz{,.asc})
sha512sums=('24f72a3e9840d531d900e96771a863baae1c71a76fcad0fda8020dff06acd8e3b65b86401ace21f034766403caf9ae97ce710ff6013bb7ed25657a6ecf325470'
            'SKIP')
b2sums=('2225f9e0835988351f84ed06f914616e25fd65bacaa93b51d0bb04185314efb9a6f60eb3539b250f54b2c2ba590f1b76594df3e625e45c8d37e38d13371bea26'
        'SKIP')
validpgpkeys=(
  '5B482B8E3E19DA7C978E1D016DE2E9078E1F50C1'  # William Roberts (Bill Roberts) <william.c.roberts@intel.com>
  '6313E6DC41AAFC315A8760A414986F6944B1F72B'  # Desai, Imran (idesai-github-gpg) <imran.desai@intel.com>
)

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-unit
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  depends+=(
    curl libcurl.so
    openssl libcrypto.so
    tpm2-tss libtss2-esys.so libtss2-fapi.so libtss2-mu.so libtss2-rc.so libtss2-sys.so libtss2-tctildr.so
  )

  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 docs/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

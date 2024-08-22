# Maintainer: Anatol Pomozov <anatol pomozov at gmail> 
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Contributor: Konstantin Plotnikov <kostyapl at gmail dot com>

pkgname=fossil
pkgver=2.24
_tag=8be0372c1051043761320c8ea8669c3cf320c406e5fe18ad36b7be5f844ca73b
pkgrel=1
pkgdesc='Simple, high-reliability, distributed software configuration management'
arch=(x86_64)
license=(BSD-2-Clause)
url='https://www.fossil-scm.org'
depends=(glibc openssl zlib sqlite)
makedepends=(tcl)
optdepends=(tcl)
source=(
  https://fossil-scm.org/home/tarball/$_tag/fossil-src-$pkgver.tar.gz
)
sha256sums=('e6f5a559369bf16baf539e69e6d0cea5a6410efa9a6e7f160c7a4932080413be')

build() {
  cd fossil-src-$pkgver
  ./configure --prefix=/usr --json --disable-internal-sqlite --with-tcl=/usr --with-tcl-private-stubs=1
  # headers and translate targets are problematic with parallel jobs
  #make -j1 bld bld/headers
  make
}

package() {
  cd fossil-src-$pkgver
  install -Dm755 fossil "$pkgdir"/usr/bin/fossil
  install -Dm644 tools/fossil-autocomplete.bash "$pkgdir"/usr/share/bash-completion/completions/fossil
  install -Dm644 tools/fossil-autocomplete.zsh "$pkgdir"/usr/share/zsh/site-functions/_fossil
  install -Dm644 COPYRIGHT-BSD2.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

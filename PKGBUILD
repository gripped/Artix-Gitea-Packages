# Maintainer: artoo <artoo@artixlinux.org>

_upstream=arch-rebuild-order

pkgname=artix-rebuild-order
pkgver=0.4.3
pkgrel=2
pkgdesc='CLI tool to determine the rebuild order of provided package(s)'
url='https://gitlab.archlinux.org/archlinux/arch-rebuild-order'
arch=('x86_64')
license=('MIT')
depends=('glibc' 'libalpm.so')
makedepends=('cargo' 'mandown' 'git')
groups=('artix-tools')
source=(git+https://gitlab.archlinux.org/archlinux/arch-rebuild-order.git#tag=v$pkgver?signed
        aro-artix.patch
        pacman-7.patch)
sha512sums=('93d0d993e8f854c038aa87842f300d1ea6328a6aef2c8688e5e38b5b0d4b577ef1d691e90619f5182716bb012bb0ac77a840391ca6ace2e053fcbc20bbf30f8f'
            '523114fa5bb31e244fba0f8acc18a4895062e7669d9560672fd6d76e68d155d1b9ed9889f21a65a833d371068608a23fd9e135212cdcc73cf2b588da5937d4e5'
            '2adfbc33c95262e95359fb56dcad049f5e2d0fa5dffbdb6875501904d0a1d186671d865a64295f26645058f916b2797ee6ca8b7770b1f420f2438ba06a7145c7')
validpgpkeys=("E499C79F53C96A54E572FEE1C06086337C50773E")

prepare() {
  cd "${_upstream}" 
  patch -Np1 -i ../aro-artix.patch
  patch -Np1 -i ../pacman-7.patch
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_upstream}" 
  cargo build --frozen --release --all-features
}

check() {
  cd "${_upstream}" 
  cargo test --frozen --all-features
}

package() {
  cd "${_upstream}" 
  make install DESTDIR="$pkgdir" PREFIX=/usr
  ln -sfv arch-rebuild-order "${pkgdir}"/usr/bin/artix-rebuild-order

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

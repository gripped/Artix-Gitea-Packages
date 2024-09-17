# Maintainer: artoo <artoo@artixlinux.org>

_upstream=arch-rebuild-order

pkgname=artix-rebuild-order
pkgver=0.4.4
pkgrel=1
pkgdesc='CLI tool to determine the rebuild order of provided package(s)'
url='https://gitlab.archlinux.org/archlinux/arch-rebuild-order'
arch=('x86_64')
license=('MIT')
depends=('glibc' 'libalpm.so')
makedepends=('cargo' 'mandown' 'git')
groups=('artix-tools')
source=(git+https://gitlab.archlinux.org/archlinux/arch-rebuild-order.git#tag=v$pkgver?signed
        aro-artix.patch)
sha512sums=('58bd2ad703c3a68b65bc9f6626a4f432c9be8166fb78fbc23d4ee07a4f10b83ecaa9be7445afe2f4869f3022d67987fefad863fd82a96eb0f81844c8ebcfe309'
            '523114fa5bb31e244fba0f8acc18a4895062e7669d9560672fd6d76e68d155d1b9ed9889f21a65a833d371068608a23fd9e135212cdcc73cf2b588da5937d4e5')
validpgpkeys=("E499C79F53C96A54E572FEE1C06086337C50773E")

prepare() {
  cd "${_upstream}" 
  patch -Np1 -i ../aro-artix.patch
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

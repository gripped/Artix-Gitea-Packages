# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: Jelle van der Waa <jelle@archlinux.org>

_upstream=arch-rebuild-order

pkgname=artix-rebuild-order
pkgver=0.4.4
pkgrel=2
pkgdesc='CLI tool to determine the rebuild order of provided package(s)'
url='https://gitlab.archlinux.org/archlinux/arch-rebuild-order'
arch=('x86_64')
license=('MIT')
depends=('glibc' 'gcc-libs' 'libalpm.so')
makedepends=('cargo' 'mandown' 'git')
groups=('artix-tools')
source=(
  "git+https://gitlab.archlinux.org/archlinux/arch-rebuild-order.git?signed#tag=v$pkgver"
  '0001-Add-compatibility-with-libalpm-16.patch'
  'aro-artix.patch'
)
sha512sums=('58bd2ad703c3a68b65bc9f6626a4f432c9be8166fb78fbc23d4ee07a4f10b83ecaa9be7445afe2f4869f3022d67987fefad863fd82a96eb0f81844c8ebcfe309'
            '54d229e380793bf02690189da7d77fa5bc64f6dd3a7bbe966695f8a382f3f147f9158537f6c7a232c661e2c2260db05558a8049ca5fc9aa98fecb8fa38c2117c'
            '523114fa5bb31e244fba0f8acc18a4895062e7669d9560672fd6d76e68d155d1b9ed9889f21a65a833d371068608a23fd9e135212cdcc73cf2b588da5937d4e5')
validpgpkeys=("E499C79F53C96A54E572FEE1C06086337C50773E")

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

prepare() {
  cd "${_upstream}"
  patch -Np1 -i ../aro-artix.patch
  git apply -3 ../0001-Add-compatibility-with-libalpm-16.patch
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

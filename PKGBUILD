# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: Jelle van der Waa <jelle@archlinux.org>

_upstream=arch-rebuild-order

pkgname=artix-rebuild-order
pkgver=0.4.5
pkgrel=1
pkgdesc='CLI tool to determine the rebuild order of provided package(s)'
url='https://gitlab.archlinux.org/archlinux/arch-rebuild-order'
arch=('x86_64')
license=('MIT')
depends=('glibc' 'libgcc' 'libalpm.so')
makedepends=('cargo' 'mandown' 'git')
groups=('artix-tools')
source=(
  "git+https://gitlab.archlinux.org/archlinux/arch-rebuild-order.git?signed#tag=v$pkgver"
  'aro-artix.patch'
)
sha512sums=('c591949598c0736b84e18742b084d1eb9c460f6d09eadb0fa3f69be2bcb89f4af9e478ed0cc5fc8fbe1db41a6544f386f87e3e30d16ef47860caa03934869af0'
            '523114fa5bb31e244fba0f8acc18a4895062e7669d9560672fd6d76e68d155d1b9ed9889f21a65a833d371068608a23fd9e135212cdcc73cf2b588da5937d4e5')
validpgpkeys=("E499C79F53C96A54E572FEE1C06086337C50773E")

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

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

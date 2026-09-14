# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors
pkgver=0.32.0
pkgrel=1
pkgdesc="Everyday-use client-side map-aware mirror ranking tool"
arch=('x86_64')
url="https://github.com/westandskif/rate-mirrors"
license=('CC-BY-NC-SA-3.0')
depends=(
  'glibc'
  'libgcc'
  'openssl'
)
makedepends=('cargo')
options=('!lto')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('a7b5c7915b0ee2b5b9406a98a7071efc3a7ae75e3729b2513a1efb29c9674f33e83bf5b2555ad6b81a37f0862aac14deb3d8df7f657adc2a18c25efc647e42c8')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname-$pkgver
  OPENSSL_NO_VENDOR=true cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  OPENSSL_NO_VENDOR=true cargo test --frozen
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/rate_mirrors "$pkgdir/usr/bin/rate-mirrors"
}

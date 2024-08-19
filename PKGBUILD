# Maintainer: artist for Artix Linux

pkgname=edi
pkgver=0.8.0.r28.ge9d30f6
pkgrel=1.1
pkgdesc="EFL based IDE"
arch=('x86_64')
url="https://www.enlightenment.org/about-edi"
license=('GPLv2')
makedepends=('git' 'meson')
depends=('efl' 'clang' 'check')
options=('!libtool' '!debug' '!strip')
source=("edi::git+https://git.enlightenment.org/enlightenment/edi.git")

pkgver() {
  cd "$pkgname"
  (set -o pipefail
   git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  cd "$pkgname"
  meson --buildtype=release --prefix=/usr build/
  ninja -C build/
}

#check() {
#  cd "$pkgname"
#  ninja -C build/ test
#}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build/ install
}

sha256sums=('SKIP')

# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
pkgver=2.1.1787156470+21ecb36
_commit=${pkgver##*+}
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('glibc' 'libgcc')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('fa6c29123829832bb04138460971c9cc07c561dc1511329b80196104640daae7')
b2sums=('b52d892bbeb75bed42cd26f29cb1d32da220718ab9ed7130f5eb53349d44fea785040861be59753d359bc3695097b6478062bdd6172b46c204f7551955550951')

build() {
  cd "LuaJIT-${_commit}"*/

  # Avoid early stripping
  make amalg PREFIX=/usr BUILDMODE=dynamic TARGET_STRIP=" @:"
}

check() {
  cd "LuaJIT-${_commit}"*/

  # Make sure that pkgver matches packaged commit
  local _ct=${pkgver##*.}
  test "${_ct%%+*}" == "$(cat .relver)"
}

package() {
  cd "LuaJIT-${_commit}"*/

  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}

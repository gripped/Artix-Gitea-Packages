# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>

pkgname=openresolv
pkgver=3.16.4
pkgrel=1
pkgdesc="resolv.conf management framework (resolvconf)"
url="https://roy.marples.name/projects/openresolv"
arch=(any)
license=(BSD-2-Clause)
provides=(resolvconf)
conflicts=(resolvconf)
depends=(bash)
makedepends=(
  git
 
)
backup=(etc/resolvconf.conf)
source=("git+https://github.com/NetworkConfiguration/openresolv?signed#tag=v$pkgver")
b2sums=('e6e1f4c219b635709c16ac2f5997a174291d6c352dbf0c1849d08a59f96ba4b41f9e8532f0c27b9563a77ca320188cf72d25e5c75bc4203d6f9c38240e2be799')
validpgpkeys=(
  A785ED2755955D9E93EA59F6597F97EA9AD45549 # Roy Marples <roy@marples.name>
)

prepare() {
  cd $pkgname
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib/resolvconf
    --sbindir=/usr/bin
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:

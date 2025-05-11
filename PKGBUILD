# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>

pkgname=openresolv
pkgver=3.16.3
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
b2sums=('142e9422d6e9c544bb73d55f5561402dd00439ede15100b528f06001640d4c2163aa2980901baaa03d504412195ff9fada5be9c73eb4357523b57e42a948b765')
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

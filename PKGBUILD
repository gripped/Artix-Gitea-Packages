# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Severen Redwood <me@severen.dev>
# Contributor: Tomasz Jakub Rup <tomasz.rup@gmail.com>

pkgname=pnpm
pkgver=10.6.2
pkgrel=0
pkgdesc='Fast, disk space efficient package manager'
arch=(any)
url=https://pnpm.io
license=(MIT)
depends=(node-gyp)
# makedepends=('git' 'pnpm')
source=("https://mirror.sanin.dev/arch-linux/extra/os/x86_64/pnpm-$pkgver-1-any.pkg.tar.zst")
b2sums=('dc4f21441769354f729bcfe8374d8146d7db7b6de2e06109370c16946530fa6a47677df5be2922d1533e2670acc3b406e829ac79d4deae1fd637c1ae1419805b')
validpgpkeys=('7B74D1299568B586BA9962B5649E4D4AF74E7DEC') # Zoltan Kochan <z@kochan.io>

build() {
  cd .
}

package() {
  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/pnpm-10.5.2-1-any.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

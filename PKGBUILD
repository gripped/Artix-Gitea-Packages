# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Severen Redwood <me@severen.dev>
# Contributor: Tomasz Jakub Rup <tomasz.rup@gmail.com>

pkgname=pnpm
pkgver=10.5.2
pkgrel=0
pkgdesc='Fast, disk space efficient package manager'
arch=('any')
url=https://pnpm.io
license=('MIT')
depends=("nodejs")
# makedepends=('git' 'pnpm')
source=("https://mirror.sanin.dev/arch-linux/extra/os/x86_64/pnpm-10.5.2-1-any.pkg.tar.zst")
b2sums=('4956b7bdd3d6f44aff21b275e3747d57ea09607c9c4bad2b4c965c576ad0cba67eaab6afb4d0dfdd4f9682102858a93f60b87cb4e78ffa5be9186d6e8742a1f3')
validpgpkeys=('7B74D1299568B586BA9962B5649E4D4AF74E7DEC') # Zoltan Kochan <z@kochan.io>

build() {
  cd .
}

package() {
  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/pnpm-10.5.2-1-any.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

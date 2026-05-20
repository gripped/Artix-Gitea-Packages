# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Severen Redwood <me@severen.dev>
# Contributor: Tomasz Jakub Rup <tomasz.rup@gmail.com>

pkgname=pnpm
pkgver=11.2.0
pkgrel=1
pkgdesc='Fast, disk space efficient package manager'
arch=(any)
url=https://pnpm.io
license=(MIT)
depends=(node-gyp)
makedepends=(
  git
  pnpm
  python
)
source=("git+https://github.com/$pkgname/$pkgname.git#tag=v$pkgver?signed")
b2sums=('0124b8450640dbbc4f695245f35676fbc80094e0fa92da8c350ff1af9952e20bc67940ed8ccadd2a66db298d2608f52c0858c2d2e065a70d9b1e52029bad5cbd')
validpgpkeys=(7B74D1299568B586BA9962B5649E4D4AF74E7DEC) # Zoltan Kochan <z@kochan.io>

prepare() {
  cd $pkgname/$pkgname
  pnpm install --frozen-lockfile
}

build() {
  cd $pkgname/$pkgname
  pnpm run compile
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname

  install -d "$pkgdir"/{usr/bin,$mod_dir/dist}
  ln -s $mod_dir/bin/$pkgname.mjs "$pkgdir"/usr/bin/$pkgname
  ln -s $mod_dir/bin/$pkgname.mjs "$pkgdir"/usr/bin/pn
  ln -s $mod_dir/bin/pnpx.mjs "$pkgdir"/usr/bin/pnpx
  ln -s $mod_dir/bin/pnpx.mjs "$pkgdir"/usr/bin/pnx

  cd $pkgname/$pkgname
  cp -r bin package.json "$pkgdir"/$mod_dir
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname LICENSE
  cd dist
  cp -r $pkgname.mjs pnpmrc templates worker.js "$pkgdir"/$mod_dir/dist
}

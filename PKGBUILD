# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Severen Redwood <me@severen.dev>
# Contributor: Tomasz Jakub Rup <tomasz.rup@gmail.com>

pkgname=pnpm
pkgver=10.5.2
pkgrel=1
pkgdesc='Fast, disk space efficient package manager'
arch=(any)
url=https://pnpm.io
license=(MIT)
depends=(node-gyp)
makedepends=(
  git
  pnpm
)
source=("https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('251af3b12a8aa97ab295244f4f7afb8bfc2537df4061e000cb096ff08a205b715bb037368c3c879e4b0494139768c39621ac993ec6f6c38f6c7a8535fbd5f447')
validpgpkeys=(7B74D1299568B586BA9962B5649E4D4AF74E7DEC) # Zoltan Kochan <z@kochan.io>

prepare() {
  mv pnpm-* pnpm
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
  ln -s $mod_dir/bin/$pkgname.cjs "$pkgdir"/usr/bin/$pkgname
  ln -s $mod_dir/bin/pnpx.cjs "$pkgdir"/usr/bin/pnpx

  cd $pkgname/$pkgname
  cp -r bin package.json "$pkgdir"/$mod_dir
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname LICENSE
  cd dist
  cp -r $pkgname.cjs pnpmrc templates worker.js "$pkgdir"/$mod_dir/dist
}

# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-chef-utils
_pkgname="${pkgname#ruby-}"
pkgver=19.3.44
pkgrel=1
pkgdesc='Basic utility functions for Core Chef Infra development'
arch=(any)
url='https://github.com/chef/chef'
license=(Apache-2.0)
depends=(ruby ruby-concurrent)
makedepends=(git ruby-rdoc ruby-rake ruby-bundler)
options=(!emptydirs)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('6f2e9740422e7a699fa3c211b12bfd440a58ddcf6f8c9d810838e9820a872228d3aeba78718c3d88d79c1e5da04d864a9e0c448d4733d62f5a3f60d641de2b6f')
b2sums=('7b141ed1a4eb3d254db5f512c4bdfffd755366af352f0b2e893f1f248a5920b13d29fcb4edfe717769bbb3d1c66dcd7b0c07f58a3054710da4ab1b20c265cff2')

build() {
  cd "$pkgname/$_pkgname"

  rake build
}

package() {
  cd "$pkgname/$_pkgname"

  local _gemdir="$(gem env gemdir)"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "pkg/$_pkgname-$pkgver.gem"

  # license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "$_gemdir/gems/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

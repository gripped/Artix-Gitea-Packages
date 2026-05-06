# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-chef-utils
_pkgname="${pkgname#ruby-}"
pkgver=19.3.0
pkgrel=1
pkgdesc='Basic utility functions for Core Chef Infra development'
arch=('any')
url='https://github.com/chef/chef'
license=('Apache-2.0')
depends=('ruby' 'ruby-concurrent')
makedepends=('git' 'ruby-rdoc' 'ruby-rake' 'ruby-bundler')
options=('!emptydirs')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('9dd8ae760e26253397623f2d5066f212ee8ae0ccc6695cca9659fc269dd9715bb467e324d630387d0246ae6bdccc7e916b78d92734d163bce71edebc2bfea388')
b2sums=('4e637cf1013ad1f987a306e0018d0898490539b2e7d8b91589d77e8d5b50069014edb4ef335f5f5ede77d2a87c3e1cc58a75d0069780c93a7a1cda0c75aa9aa7')

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

  # delete cache
  rm -rf "$pkgdir/$_gemdir/cache"

  # license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "$_gemdir/gems/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

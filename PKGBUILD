# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-chef-utils
_pkgname="${pkgname#ruby-}"
pkgver=19.2.108
pkgrel=1
pkgdesc='Basic utility functions for Core Chef Infra development'
arch=('any')
url='https://github.com/chef/chef'
license=('Apache-2.0')
depends=('ruby' 'ruby-concurrent')
makedepends=('git' 'ruby-rdoc' 'ruby-rake' 'ruby-bundler')
options=('!emptydirs')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('ad6e4d64b384b0623301be0460af3a8b9af5fc3e49875087d978fba1657dff91e118c111d7c49393eb91646083a422e0d86eeb37da558a831053706dfaf142fc')
b2sums=('dd9bcc60db1bf65ef4f931155695bd4766e699107428863db0aa1d67cec757bfa32cfb3108a38b4be940d3995f357c7ef34a04c3a48ae8fc491a71627e7be2e7')

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

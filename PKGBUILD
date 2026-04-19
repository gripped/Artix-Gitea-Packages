# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-chef-utils
_pkgname="${pkgname#ruby-}"
pkgver=19.2.105
pkgrel=1
pkgdesc='Basic utility functions for Core Chef Infra development'
arch=('any')
url='https://github.com/chef/chef'
license=('Apache-2.0')
depends=('ruby' 'ruby-concurrent')
makedepends=('git' 'ruby-rdoc' 'ruby-rake' 'ruby-bundler')
options=('!emptydirs')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('1f4d46a0411dc458064d110d9d961bfabef8a1e77d01a3443d5c8798e98622efed0262f06d5f5d839f1a2a6c5e4cab9b58f68dc145bd92a95203dd3bdeed0891')
b2sums=('4f2a3256410faf45e9f8c252fc9ab8c9e49cbdde249ea520e9b4472a9dafa1bd1a534e618fcec928a4000c9f040732dcfc4b37f56b5d894b41926f93e8cbe614')

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

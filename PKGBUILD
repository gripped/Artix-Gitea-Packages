# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-chef-utils
_pkgname="${pkgname#ruby-}"
pkgver=19.2.116
pkgrel=1
pkgdesc='Basic utility functions for Core Chef Infra development'
arch=('any')
url='https://github.com/chef/chef'
license=('Apache-2.0')
depends=('ruby' 'ruby-concurrent')
makedepends=('git' 'ruby-rdoc' 'ruby-rake' 'ruby-bundler')
options=('!emptydirs')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('d512e30acffe14f624017980d67cfb46ca822e32963eac20db56b134b6e02135126dc9c906021089878cecf2b78e0edacba435eaf663d97c4723868bea0d33d0')
b2sums=('98870b1cd71467970612227e3eff1f844e91c54647be0714d3f821b81671bac9d05e1e20725a3206ddd5ec44f2f4c49be387a5bcd5a23a3a74716b0102a8c47b')

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

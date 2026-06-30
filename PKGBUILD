# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

pkgname=ruby-mixlib-config
_pkgname="${pkgname#ruby-}"
pkgver=3.1.8
pkgrel=1
pkgdesc='A class based configuration library'
arch=(any)
url='https://github.com/chef/mixlib-config'
license=(Apache-2.0)
depends=(ruby-tomlrb)
makedepends=(git ruby-rdoc ruby-rake ruby-bundler ruby-rspec)
options=(!emptydirs)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('1f6fc6be35d64e59c3d04ce0e6018096fe8fe7ca413306522d6e515cea980b0d0c750346817ba931bb082017190ecbe86bacb7ae7b1daf708be8b715fa8047d2')
b2sums=('1ed4265d8fe7083997d1b4918dd454aa7de510a40275745cc81e0cdead845559578fb08ffa1e6c9799dbbf4cfe3a3e6f9137af3af522c9dc720d50da483b7ce7')

build() {
  cd "$pkgname"

  rake build
}

package() {
  cd "$pkgname"

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
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-chef-utils
_pkgname="${pkgname#ruby-}"
pkgver=19.3.42
pkgrel=1
pkgdesc='Basic utility functions for Core Chef Infra development'
arch=(any)
url='https://github.com/chef/chef'
license=(Apache-2.0)
depends=(ruby ruby-concurrent)
makedepends=(git ruby-rdoc ruby-rake ruby-bundler)
options=(!emptydirs)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('84298ec79afb019f9e6d56013a79684b96791043358d688ea1f7cff9f9537cef54ac25b7b51deb1d925253a690a3f1536808daf2d09237bc8a7588cdfefb19d3')
b2sums=('d9c1913196f0b59fbab819169b71b0c770bd72d6e9338e3bf6f6ceebedabfad84d91f189e659c9de42b6ff1aeecbbf655fe86bf78fa66ea0890f18b3a4e564a7')

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

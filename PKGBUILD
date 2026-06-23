# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-chef-utils
_pkgname="${pkgname#ruby-}"
pkgver=19.3.38
pkgrel=1
pkgdesc='Basic utility functions for Core Chef Infra development'
arch=(any)
url='https://github.com/chef/chef'
license=(Apache-2.0)
depends=(ruby ruby-concurrent)
makedepends=(git ruby-rdoc ruby-rake ruby-bundler)
options=(!emptydirs)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('760047566e3684971e618c16d56b2b572638ff12a40b8b1c648049d000360ced51bfb605f0715a6e2050f7f0fda0618852d8ac5a8c4d4095000e0f0cf5cce454')
b2sums=('da50fed7e44fea2cdd642b9f87c92adc05807785d3b7a052b7710518be4eb56055b5ddd49245e6f9c53f625769c58e3efa3c9e01156d5bb4d14b21705d177951')

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

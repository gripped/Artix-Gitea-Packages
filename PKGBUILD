# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-protocol-http
pkgver=0.62.0
pkgrel=1
pkgdesc='Provides abstractions to handle HTTP protocols'
arch=(any)
url='https://github.com/socketry/protocol-http'
license=(MIT)
depends=(
  ruby
)
makedepends=(
  git
  ruby-rdoc
)
checkdepends=(
  ruby-bake
  ruby-bake-test
  ruby-bake-test-external
  ruby-bundler
  ruby-covered
  ruby-decode
  ruby-sus
  ruby-sus-fixtures-async
  ruby-sus-fixtures-benchmark
)
options=(!emptydirs)
source=("git+${url}.git#tag=v${pkgver}")
sha512sums=('cddb41bf31ce897caaa3d672295e21287c4a2e20a65f216beb86f1c1443a0ca6c00c7939f5be3a387d6cb020d5e299878896a38523e1cb082fcef749d61e5b8b')
b2sums=('6db11e4893d795779896734aeab40b6dc8fa15733b64d22d55962fc5c0794a520bc7fc1d64f1db793e691fcc320e8049635a3fae71cf7799248fa19f2def5a08')

prepare() {
  cd protocol-http

  sed -i '/signing_key/d' protocol-http.gemspec

  sed --in-place \
    --expression '/group :maintenance/,/end/d' \
    --expression '/rubocop/d' \
    gems.rb
}

build() {
  local _gemdir="$(gem env gemdir)"
  cd protocol-http
  gem build protocol-http.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    protocol-http-$pkgver.gem
  find "tmp_install/$_gemdir/gems/" \
    -type f \
    \( \
        -iname "*.o" -o \
        -iname "*.c" -o \
        -iname "*.so" -o \
        -iname "*.time" -o \
        -iname "gem.build_complete" -o \
        -iname "Makefile" \
    \) \
    -delete
  rm -r tmp_install/$_gemdir/cache
}

check() {
  local _gemdir="$(gem env gemdir)"
  cd protocol-http
  GEM_HOME="tmp_install/$_gemdir" bake test
}

package() {
  cd protocol-http
  cp -a tmp_install/* "$pkgdir"/
}

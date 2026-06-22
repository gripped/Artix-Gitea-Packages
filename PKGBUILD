# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-async-http
pkgver=0.95.0
pkgrel=1
pkgdesc='A HTTP client and server library'
arch=(any)
url='https://github.com/socketry/async-http'
license=(MIT)
depends=(
  ruby
  ruby-async
  ruby-async-pool
  ruby-io-endpoint
  ruby-io-stream
  ruby-metrics
  ruby-protocol-http
  ruby-protocol-http1
  ruby-protocol-http2
  ruby-protocol-url
  ruby-traces
)
makedepends=(
  git
  ruby-rdoc
)
checkdepends=(
  ruby-async-container
  ruby-bake
  ruby-bake-test
  ruby-bake-test-external
  ruby-bundler
  ruby-covered
  ruby-decode
  ruby-localhost
  ruby-rack-test
  ruby-sus
  ruby-sus-fixtures-async
  ruby-sus-fixtures-async-http
  ruby-sus-fixtures-benchmark
  ruby-sus-fixtures-openssl
)
options=(!emptydirs)
source=(git+https://github.com/socketry/async-http.git#tag=v$pkgver)
sha512sums=('d3f9b3f57b49425518048621dbb8f79435e280b3c0fa6d327d6e3a90f7ab3ae968e474b897a36fb4c186fa0b985bfb85677132cc64a2a95bcde931f9b7c28b35')
b2sums=('3345b7d9883a0f10a9a6d8f4c87de9b6e9170389410606a4830f88b2f9cc5bd310722500602f8fc61ebb31becb076076622f903c6810b8437c96c92ab9a2f9bd')

prepare() {
  cd async-http

  sed -r \
    -e 's|~>|>=|g' \
    -e '/signing_key/d' \
    -i async-http.gemspec

  sed --in-place \
    --expression '/group :maintenance/,/end/d' \
    --expression '/rubocop/d' \
    gems.rb
}

build() {
  local _gemdir="$(gem env gemdir)"
  cd async-http
  gem build async-http.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    async-http-$pkgver.gem
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
  cd async-http
  GEM_HOME="tmp_install/$_gemdir" bake test
  GEM_HOME="tmp_install/$_gemdir" sus
}

package() {
  cd async-http
  cp -a tmp_install/* "$pkgdir"/
}

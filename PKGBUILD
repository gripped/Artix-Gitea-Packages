# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bert Peters <bertptrs@archlinux.org>

pkgname=ruby-cucumber-messages
pkgver=34.0.0
pkgrel=1
pkgdesc="Protocol Buffer messages for Cucumber's inter-process communication"
arch=(any)
url='https://github.com/cucumber/messages/tree/main/ruby'
license=(MIT)
depends=(
  ruby
)
makedepends=(
  git
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-rake
  ruby-rspec
)
options=(!emptydirs)
source=(git+https://github.com/cucumber/messages.git#tag=v$pkgver)
sha512sums=('99db3cf9164b6ce66f2c8402267403497690cf9bec972457d71a675cc05f90b7171de38c94b249a192413945ce5aa2b2fe3aaaf15ce8ed8dd743919100175d07')
b2sums=('8334c9d38d2770408d0aa2e8533d4bf66dad5939bc47ee0ac40e87a87809e54603e3e77d8fcf7303a39c3106e22fe2d5f5a36c3c4777892392b28f0438b19a1e')

build() {
  local _gemdir="$(gem env gemdir)"
  cd messages/ruby
  gem build cucumber-messages.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    cucumber-messages-$pkgver.gem
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
  cd messages/ruby
  GEM_HOME="tmp_install/$_gemdir" rake
}

package() {
  cd messages/ruby
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 ../LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

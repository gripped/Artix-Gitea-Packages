# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-ruby_memcheck
pkgver=2.0.1
pkgrel=1
pkgdesc='Use Valgrind memcheck without going crazy'
arch=(any)
url='https://github.com/Shopify/ruby_memcheck'
license=(MIT)
depends=(
  ruby
  ruby-nokogiri
  valgrind
)
makedepends=(
  git
)
checkdepends=(
  ruby-bundler
  ruby-minitest
  ruby-racc
  ruby-rake
  ruby-rake-compiler
  ruby-rspec-core
)
options=(!emptydirs)
source=(git+https://github.com/Shopify/ruby_memcheck.git#tag=$pkgver)
sha256sums=('f96fff9de7ef4220905d314db3689a590c6ff8c56a4791f54204d774ab9ae353')

prepare() {
  cd ruby_memcheck
  # Backport Ruby 3.4 Valgrind fixes without the Ruby-free-at-exit-only mode:
  # https://github.com/Shopify/ruby_memcheck/commit/72e957cb038668e025b6c7210430d2e8d761fcd8
  git cherry-pick -n 4f6354d 6c4e169 72e957c 5b16f38 8f88ed6 98d7949 988312b
}

build() {
  local _gemdir="$(gem env gemdir)"
  cd ruby_memcheck
  gem build ruby_memcheck.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    ruby_memcheck-$pkgver.gem
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
  cd ruby_memcheck
  GEM_HOME="tmp_install/$_gemdir" rake
}

package() {
  cd ruby_memcheck
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

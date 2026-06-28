# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bert Peters <bertptrs@archlinux.org>

pkgname=ruby-cucumber-messages
pkgver=33.0.4
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
sha512sums=('45d8ad018ac1942e4d1d0718fe13c62f3be1518ff9f82e240e444a2d3e124d25ffca33852d3d25ae7f2b0bb5035bd4857f258ccfd77258c3ebf262bbc3cadc62')
b2sums=('47da6909f6c7ab9b818beef05ac089b1c41a1f02f28cf70695970e5afb43be650642402567e8cd8cd43d053f96a30e41549dc7ad906e91391b95947eb8aa3a49')

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

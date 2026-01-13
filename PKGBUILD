# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bert Peters <bertptrs@archlinux.org>

pkgname=ruby-cucumber-messages
pkgver=31.1.0
pkgrel=1
pkgdesc="Protocol Buffer messages for Cucumber's inter-process communication"
arch=(any)
url='https://github.com/cucumber/messages/tree/main/ruby'
license=(MIT)
depends=(
  ruby
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-rake
  ruby-rspec
)
options=(!emptydirs)
source=(https://github.com/cucumber/messages/archive/v$pkgver/cucumber-messages-$pkgver.tar.gz)
sha512sums=('104c746b3ce2c8e8981093bb26e0a1d84e7eccdfad2edca2ab2a3c10f95e8c4d76a5579b067d299f33464d20cbc27ee65ec11bb30b5518a93f61ca438827c777')
b2sums=('72f93b64e697df22cb816ca7aa2cd4331b2ebe97ec59277c62dc962f9090dc57ae4ee7c9d9325b1bae7269103404bb849679c96e6b38303af9dc8c9ce4d8fc3c')

build() {
  local _gemdir="$(gem env gemdir)"
  cd messages-$pkgver/ruby
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
  cd messages-$pkgver/ruby
  GEM_HOME="tmp_install/$_gemdir" rake
}

package() {
  cd messages-$pkgver/ruby
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 ../LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

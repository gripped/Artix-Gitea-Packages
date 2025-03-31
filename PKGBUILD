# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-bake-test-external
pkgver=0.6.0
pkgrel=1
pkgdesc='Run external test suites to check for breakage'
arch=(any)
url='https://github.com/ioquatix/bake-test-external'
license=(MIT)
depends=(
  ruby
  ruby-bake
)
makedepends=(
  git
  ruby-rdoc
)
checkdepends=(
  git
  ruby-bake-test
  ruby-bundler
  ruby-rspec
  ruby-sus
)
options=(!emptydirs)
source=(git+https://github.com/ioquatix/bake-test-external.git#tag=v$pkgver)
sha512sums=('4e0d818540a16651c2d25e1d250f8bce791dbedc18c81ddac8be46360df44af8f033286c77c224fdc13aa3c37c92a7860e17fe1dd59ab938e630c84128605ed0')
b2sums=('7f24ce0b24c61007a37c04985dece2df7d47499f787254e352c16b86e99a806519c2e528377e9ea83c8d9ac27ad85ec39d1d0954be80e74b775b487a43f378d7')

prepare() {
  cd bake-test-external
  sed -e '/signing_key/d' -i bake-test-external.gemspec

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "bake-test-external.gemspec"

  sed --in-place \
    --expression '/group :maintenance/,/end/d' \
    --expression '/rubocop/d' \
    gems.rb
}

build() {
  local _gemdir="$(gem env gemdir)"
  cd bake-test-external
  gem build bake-test-external.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    bake-test-external-$pkgver.gem
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
  cd bake-test-external
  GEM_HOME="tmp_install/$_gemdir" bake test
}

package() {
  cd bake-test-external
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 license.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}

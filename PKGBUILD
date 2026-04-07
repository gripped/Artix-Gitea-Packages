# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-parser
pkgver=3.3.11.0
pkgrel=1
pkgdesc='A production-ready Ruby parser written in pure Ruby'
arch=(any)
url='https://github.com/whitequark/parser'
license=(MIT)
depends=(
  ruby
  ruby-ast
  ruby-racc
)
makedepends=(
  git
  ragel6
  ruby-bundler
  ruby-rake
  ruby-rdoc
)
checkdepends=(
  ruby-erb
  ruby-minitest
  ruby-simplecov
)
options=(!emptydirs)
source=(git+https://github.com/whitequark/parser.git#tag=v$pkgver)
sha512sums=('6c82a943f1c3457bf91138c2f4331d62442cf6f829ffb46760b641bb3f631858bd5db8beb60a67cfe87a1dfa5a0cafe9f43d23b1c5551976dadbabc2380c4dc5')
b2sums=('bac559fd995738b7b52c62170a5930202ff184658aaf9db3742b33e6b9382d420b99bd45a87acad8624ec9fd81df2d7fbe84d5f2503ba48f02d4d09c3a3de46d')

prepare() {
  cd parser
  sed 's/~>/>=/' -i parser.gemspec
  sed -i '/[cC]liver/d' Rakefile
}

build() {
  local _gemdir="$(gem env gemdir)"
  cd parser
  rake generate
  gem build parser.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    parser-$pkgver.gem
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
  cd parser
  GEM_HOME="tmp_install/$_gemdir" rake
}

package() {
  cd parser
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

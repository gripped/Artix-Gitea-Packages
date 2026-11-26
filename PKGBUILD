# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Bert Peters <bertptrs@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

_name=term-ansicolor
pkgname=ruby-$_name
pkgver=1.12.0
pkgrel=1
pkgdesc='A ruby library that colors strings using ANSI escape sequences'
arch=('any')
url='https://github.com/flori/term-ansicolor'
license=('Apache-2.0')
depends=(
  'ruby'
  'ruby-tins'
  'ruby-bigdecimal' # missing dep of ruby-tins
)
makedepends=(git)
checkdepends=(
  ruby-test-unit
  ruby-simplecov
)
options=('!emptydirs')
source=(
  $pkgname::git+https://github.com/flori/term-ansicolor#tag=v$pkgver
)
sha256sums=('cd42c8c14c2139eeb6aa16220c93f0e7bc8d88a10d4452f9ab377e83a0e6cb8c')

prepare() {
  cd "$pkgname"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"

  # the gem_hadar crate isn't packaged but also not necessary
  sed --in-place --regexp-extended '/hadar/Id' "tests/test_helper.rb"
}

build() {
  cd "$pkgname"

  local _gemdir="$(gem env gemdir)"

  gem build "${_name}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --build-root "tmp_install" \
    "${_name}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_name}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_name}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/gems/" \
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

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd "$pkgname"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="../tmp_install/${_gemdir}" ruby -Ilib:tests tests/*_test.rb
}

package() {
  cd "$pkgname"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

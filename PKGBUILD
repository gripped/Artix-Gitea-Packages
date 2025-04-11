# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

pkgname="rubocop"
pkgver=1.75.2
pkgrel=1
pkgdesc='A Ruby code style checking and code formatting tool'
arch=('any')
url='https://rubocop.org/'
license=('MIT')
provides=('ruby-rubocop')
depends=(
  ruby
  ruby-memory_profiler
  ruby-parallel
  ruby-parser
  ruby-rainbow
  ruby-regexp_parser
  ruby-rexml
  ruby-rubocop-ast
  ruby-ruby-progressbar
  ruby-unicode-display_width
)
checkdepends=(
  asciidoctor
  procps-ng
  ruby-bundler
  ruby-irb
  ruby-rake
  ruby-rspec
  ruby-rubocop-performance
  ruby-rubocop-rake
  ruby-rubocop-rspec
  ruby-stackprof
  ruby-test-queue
  ruby-webmock
  ruby-yard
)
options=('!emptydirs')
source=("https://github.com/rubocop/rubocop/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e493449266a5f7798cca7e5951524d4b78dea02f64f652d4395b5913d9558dd727cf89cb80c6920ec82e09a7e13319503a7974dd7738c0e5dd362e8c51c15688')
b2sums=('2cdf1eb21707ab2080ab3084830062927e6f37acdd2624b539b35358510c6127372fe16363877f83131168d0cf5bc3fcb1ad3cd5feb6c039593924692d2d64de')

prepare() {
  cd "${pkgname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${pkgname}.gemspec" Gemfile

  # we need webmock
  sed --in-place '/group/d' Gemfile
  sed --in-place '/end/d' Gemfile

  # Remove dependency on bump and simplecov
  sed --in-place --regexp-extended '/bump|simplecov/d' Gemfile
  rm tasks/cut_release.rake
}

build() {
  cd "${pkgname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem build "${pkgname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${pkgname}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${pkgname}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${pkgname}-${pkgver}/ri/ext/"

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
  cd "${pkgname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/${_gemdir}" rake ascii_spec spec
}

package() {
  cd "${pkgname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:

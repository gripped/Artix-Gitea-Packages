# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='parallel'
pkgname="ruby-${_gemname}"
pkgver=2.0.1
pkgrel=1
pkgdesc='Run any kind of code in parallel processes'
arch=('any')
url="https://github.com/grosser/${_gemname}"
license=('MIT')
depends=(
  ruby
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  lsof
  procps-ng
  ruby-base64
  ruby-bigdecimal
  ruby-benchmark
  ruby-bundler
  ruby-logger
  ruby-mutex_m
  ruby-rake
  ruby-rspec
  ruby-rspec-rerun
  ruby-ruby-progressbar
  ruby-sqlite3
)
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6fa34bc22a97950ad0cb3c2f486fbee78e5340cc7f7eb07f551bf0f0fb55cfc4769916237fad7e815cff1e159603fa0680968d99c8ca1666dfb22784554d35ae')
b2sums=('1be27a1fa266b3823b980bee55a9d078dab7ec6f270e677da6b456e6667e22dffd5d92fc2b97f04b0e830891a80c3f3a9c4b59d57010d21e273a72e21e6c40dd')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended \
    --expression 's|~>|>=|g' \
    "${_gemname}.gemspec" \
    Gemfile

  # we build based on a tar archive, not a git repo
  sed --in-place --regexp-extended 's|git ls-files lib MIT-LICENSE.txt|find lib MIT-LICENSE.txt -type f|' "${_gemname}.gemspec"

  rm --verbose Gemfile.lock

  # Remove dependency on activerecord, bump, rubocop, legacy_formatters and mysql
  sed --in-place --regexp-extended '/activerecord|bump|rubocop|legacy_formatters|mysql/d' Gemfile

  # Remove certain tests as they use activerecord which Arch cannot ship right now.
  rm spec/cases/map_with_ar.rb
  rm spec/cases/each_with_ar_sqlite.rb
  sed --in-place --regexp-extended '/works with SQLite/,/end/d' spec/parallel_spec.rb

  # This test is simply broken
  sed --in-place --regexp-extended '/does not leave processes behind while running/,/end/d' spec/parallel_spec.rb
}

build() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem build --verbose "${_gemname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install${_gemdir}/cache/" \
    "tmp_install${_gemdir}/gems/${_gemname}-${pkgver}/vendor/" \
    "tmp_install${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  find "tmp_install${_gemdir}/gems/" \
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

  find "tmp_install${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}


check() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install${_gemdir}" rspec
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 MIT-LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:

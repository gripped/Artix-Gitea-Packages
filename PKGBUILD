# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_gemname='falcon'
pkgname="ruby-${_gemname}"
pkgver=0.55.2
pkgrel=1
pkgdesc='A fast, asynchronous, rack-compatible web server'
arch=(any)
url='https://github.com/socketry/falcon'
license=(MIT)
depends=(
  ruby
  ruby-async
  ruby-async-container
  ruby-async-http
  ruby-async-http-cache
  ruby-async-service
  ruby-async-service-supervisor
  ruby-async-utilization
  ruby-bundler
  ruby-localhost
  ruby-protocol-http
  ruby-protocol-rack
  ruby-samovar
)
makedepends=(
  git
  ruby-rdoc
)
checkdepends=(
  ruby-async-process
  ruby-async-websocket
  ruby-bake
  ruby-bake-test
  ruby-bake-test-external
  ruby-covered
  ruby-decode
  ruby-puma
  ruby-rackup
  ruby-sus
  ruby-sus-fixtures-async
  ruby-sus-fixtures-async-http
  ruby-sus-fixtures-openssl
)
options=(!emptydirs)
source=("git+https://github.com/socketry/falcon.git#tag=v$pkgver")
sha512sums=('7556fe22f8eebe6627c6524fd15f25790a34243bf984e2b6ea23800096923d8952ad925efc8736bef0df1d747adf9307e96c0d6240f600d75c78d7098e07eb76')
b2sums=('a77c09870b0e89455799aed5f9182fe969ee94395928def6c7158b14606ab276e50aa3c4d7d2929d6b1080f9982fbf95310641b9c218b55bc118df4c641701bb')

prepare() {
  cd "${_gemname}"

  sed --in-place --regexp-extended \
    --expression 's|~>|>=|g' \
    --expression '/signing_key/d' \
    falcon.gemspec

  sed --in-place \
    --expression '/group :maintenance/,/end/d' \
    --expression '/group :development/,/end/d' \
    --expression '/rubocop/d' \
    gems.rb
}

build() {
  cd "${_gemname}"

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

  # remove unreproducible files
  rm --force --recursive --verbose \
    tmp_install/usr/bin/*.lock \
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


package() {
  cd "${_gemname}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 license.md --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:

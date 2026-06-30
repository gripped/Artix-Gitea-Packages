# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_gemname='falcon'
pkgname="ruby-${_gemname}"
pkgver=0.55.4
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
sha512sums=('6f3466acdda26937742e15ce556d9f02733d0af57caec1c9f348b5b66cc3d16179c7ccbbe7a6a8883cea521456330385149489d0780bdab5fe3f72116552ea3a')
b2sums=('8e675ed116e77a50d4797c585b3f24676cd2b3fb107fb5ccd079d9e26c61b4630d043b939fe0a58b84a1f7b868fad406e5bd3e8be5d5922bbe5180086d432932')

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

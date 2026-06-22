# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_gemname='falcon'
pkgname="ruby-${_gemname}"
pkgver=0.55.1
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
sha512sums=('33ff24cd1a385b7c841e826e47927aee2c9238a814303f21bed504c39ae6e6385ba3e5ddc3ecddd07614c9a867d324b2bfeb964fa54c3c87f3d2d40d634ee028')
b2sums=('64c083cf72049fd4ad2049e1b701dab33df3d562b25c6be90ee1aee0a7d3660de02316e4e1a5715e99d4546d61d0cce1be9844eb79d40f0c0e71ac523a17960c')

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

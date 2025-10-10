# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname=rack
pkgname=ruby-rack
pkgver=3.2.2
pkgrel=1
pkgdesc='Minimal, modular, and adaptable interface for developing web applications'
url='https://rack.github.io/'
arch=('any')
license=('MIT')
depends=(
  ruby
  ruby-erb
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-minitest
  ruby-minitest-global_expectations
  ruby-rake
)
options=('!emptydirs')
source=(
  "https://github.com/rack/rack/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha512sums=('ea9f239c04c0e2561e08d15196768cec2155bc6376ad3fa0b413d8412a617c9275dfb37e1eedbc1a96818fa76356d279a7a28341b30a9fe7ead0116a4daeb130')
b2sums=('76612b0132d901b1c782c84da43bcebfe228276f8e0788e705d3a549a9836375be2aa224705323b71be9ae1ec72ab489170eb1c170e1df32b25bd4b3794c43fe')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
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

  GEM_HOME="tmp_install${_gemdir}" rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 MIT-LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:

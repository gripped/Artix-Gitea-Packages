# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='rdoc'
pkgname="ruby-${_gemname}"
pkgver=6.10.0
pkgrel=1
pkgdesc='Command-line documentation generator for Ruby projects'
arch=('any')
url='https://ruby.github.io/rdoc/'
license=(
	Ruby
)
depends=(
  ruby
  ruby-erb
  ruby-psych
)
makedepends=(
  ruby-bundler
  ruby-kpeg
  ruby-racc
  ruby-rake
  ruby-rdoc
)
checkdepends=(
  ruby-test-unit
  ruby-test-unit-ruby-core
)
options=('!emptydirs')
source=("https://github.com/ruby/rdoc/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('670295bf8dceb59100fcf6cef46942414d5b1367ff604be3623b5264955c879e37f0bbe382af48a22113f7702d6e3d6e2ed122b6649466779ae4bca1cb0c128b')
b2sums=('f73029ea1d4984510a2ffe30ca608f609b218948b34ea9966e0ea0482b20946b90b753fe905109a042819677a291442fadc9e66961648db4f1bc442fc817600b')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  # rake build - can't be used as it requires rubocop: https://github.com/ruby/rdoc/blob/v6.4.0/Rakefile#L99-L107
  rake generate
  gem build "${_gemname}.gemspec"

  rake rdoc
}

check() {
  cd "${_gemname}-${pkgver}"

  rake normal_test
  rake rubygems_test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"
  local _platform="$(gem env platform | cut -d':' -f2)"
  local _extension_api_version="$(ruby -e 'puts Gem.extension_api_version')"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "${pkgdir}/${_gemdir}" \
    --bindir "${pkgdir}/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  install --verbose --directory --mode=0755 \
    "${pkgdir}/usr/lib/ruby/${_extension_api_version}/${_platform}" \
    "${pkgdir}${_gemdir}/specifications/default"

  mv --verbose "${pkgdir}${_gemdir}/specifications/${_gemname}-${pkgver}.gemspec" "${pkgdir}${_gemdir}/specifications/default/${_gemname}-${pkgver}.gemspec"
  mv --verbose "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/lib/${_gemname}.rb" "${pkgdir}/usr/lib/ruby/${_extension_api_version}/${_gemname}.rb"
  mv --verbose "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/lib/${_gemname}" "${pkgdir}/usr/lib/ruby/${_extension_api_version}/${_gemname}"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "${pkgdir}${_gemdir}/cache/" \
    "${pkgdir}${_gemdir}/build_info/" \
    "${pkgdir}${_gemdir}/extensions/" \
    "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/"{.git*,bin,man,*.*,Gemfile,Rakefile} \
    "${pkgdir}${_gemdir}/plugins/" \
    "${pkgdir}${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  install --verbose -D --mode=0644 man/ri.1 --target-directory "${pkgdir}/usr/share/man/man1"
  install --verbose -D --mode=0644 LEGAL.rdoc LICENSE.rdoc --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md *.rdoc --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

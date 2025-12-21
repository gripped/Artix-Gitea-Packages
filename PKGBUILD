# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jonne Haß <me@jhass.eu>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='bundler'
pkgname="ruby-${_gemname}"
pkgver=4.0.2
pkgrel=1
pkgdesc="Manages an application's dependencies through its entire life, across many machines, systematically and repeatably"
arch=('any')
url='https://bundler.io'
license=('MIT')
depends=(
  ruby
)
makedepends=(
  ruby-rake
  ruby-rdoc
)
# checkdepends=(
#   git
#   ruby-parallel_tests
#   ruby-rspec
# )
options=('!emptydirs')
source=("https://github.com/rubygems/rubygems/archive/bundler-v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e9ed127cf799e07cfec7868db59ce2bedf5438a028a7551397ebc8d50617d9085a2c51dcd04e89b8f1370cb4b87b213e86f1a29ecb4e528848924e453765c9a2')
b2sums=('f78f736744a757abf72e22f177b6950de2f040d3be58c6d3e2315ab8747dec01f728d520ec2f2f4ad09fefb64a674319f441fcf50625a689bf269bc1a39f6953')

prepare() {
  cd "rubygems-${_gemname}-v${pkgver}/${_gemname}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "rubygems-${_gemname}-v${pkgver}/${_gemname}"

  gem build "$_gemname.gemspec"
}

# So far tests are not working reliably and hang often
#check() {
#  cd "rubygems-${_gemname}-v${pkgver}/${_gemname}"
#
#  rake spec:all
#}

package() {
  cd "rubygems-${_gemname}-v${pkgver}/${_gemname}"

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
    "${pkgdir}${_gemdir}/specifications/default" \
    "${pkgdir}/usr/share/man/man1" \
    "${pkgdir}/usr/share/man/man5"

  mv --verbose "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/lib/bundler/man"/*.1 "${pkgdir}/usr/share/man/man1"
  mv --verbose "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/lib/bundler/man"/*.5 "${pkgdir}/usr/share/man/man5"
  mv --verbose "${pkgdir}${_gemdir}/specifications/${_gemname}-${pkgver}.gemspec" "${pkgdir}${_gemdir}/specifications/default/${_gemname}-${pkgver}.gemspec"
  mv --verbose "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/lib/${_gemname}.rb" "${pkgdir}/usr/lib/ruby/${_extension_api_version}/${_gemname}.rb"
  mv --verbose "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/lib/${_gemname}" "${pkgdir}/usr/lib/ruby/${_extension_api_version}/${_gemname}"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "${pkgdir}${_gemdir}/cache/" \
    "${pkgdir}${_gemdir}/build_info/" \
    "${pkgdir}${_gemdir}/extensions/" \
    "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/"{.gitignore,Rakefile,*.*} \
    "${pkgdir}${_gemdir}/plugins/" \
    "${pkgdir}${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  install --verbose -D --mode=0644 LICENSE.md --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

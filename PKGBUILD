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
pkgver=4.0.1
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
sha512sums=('22e26a940cce1d8192bff39707e6803a094034310736f9166139d44b5e2e0a3b058903abd06724726501b75a9e41ec48d53d80d50b1ba4701a5eb6d205e6019d')
b2sums=('80dfef282e205337639abdf0e80c7b89bbfd396158b6516836daf04232af5e4c9bde3df18c929fe43434087fdbce96b4d5bf86edb4f99dad69f826a21413100a')

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

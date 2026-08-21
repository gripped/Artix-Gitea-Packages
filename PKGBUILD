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
pkgver=4.0.17
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
sha512sums=('3960a95b2a78bd5d75255a131bfaed034c09ae89e3e06f75e1739bf425341da96d4b838380729c534fdf3e4669aa295ac6cb29caa5f6e69e4304ef69fec563f8')
b2sums=('8a307728a192c3e7816481c778bc4a6ce639203939af540f5c576f970c22da16d1cec4409ee0b5f1e24208add030f4ac9b067d7eb27c80fe16df2f6ade39d2e8')

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

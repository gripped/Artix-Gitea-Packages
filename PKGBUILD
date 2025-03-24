# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: mtorromeo

_gemname=diff-lcs
pkgname=ruby-${_gemname}
pkgver=1.6.0
pkgrel=1
pkgdesc='Diff::LCS computes the difference between two Enumerable sequences using the McIlroy-Hunt longest common subsequence (LCS) algorithm'
url='https://github.com/halostatue/diff-lcs'
arch=('any')
license=('MIT' 'PerlArtistic' 'GPL2')
depends=(
  ruby
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-hoe
  ruby-rake
  ruby-rspec
)
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('90d0eb9fd8b8beb02d7e2cd3f37958bfa358eb156f1c87529ae528bf3af736502609309d4cf280446feba697c49a20076b6ed162db3b5eb10bab123e22344e05')
b2sums=('40cbd753491557caac8f60f3c8bc5a57ecb0953a72a1e1227da7efcc29b6b7bc73bf66a3851015c538f266ab4e8166a209a61e0cc8a168daf7fa6402904a0112')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended \
    --expression 's|~>|>=|g' \
    --expression 's|"CONTRIBUTING.md".freeze, ||g' \
    "${_gemname}.gemspec"
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

  install --verbose -D --mode=0644 LICENCE.md --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:

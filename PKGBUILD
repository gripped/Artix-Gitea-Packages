# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Roberto Valentini <valantin89 [at] gmail [dot] com>

_gemname='json-schema'
pkgname="ruby-${_gemname}"
pkgver=5.0.0
pkgrel=2
pkgdesc='Interface for validating JSON objects against a JSON schema conforming to JSON Schema Draft 4.'
arch=('any')
url='https://github.com/voxpupuli/json-schema'
license=('MIT')
depends=(
  ruby
  ruby-addressable
)
makedepends=(
  ruby-bundler
  ruby-rdoc
)
checkdepends=(
  ruby-minitest
  ruby-rake
  ruby-test-unit
  ruby-webmock
)
options=(!emptydirs)
source=(
  "${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
  "${pkgname}_remove-rubocop.patch"
)
sha512sums=('2f8c7aaa6b5e53b73c804ebccff1d5b33057d3a27d5de02392a51f0d563376fca6de24d23df659b7afce1f0bb719e5fbcae515043bebd8225586f010ca8b0962'
            'b02d99c1773ebe61275be07558a53e0e7087db9c9e8aa9d2738d07b5aabff6fd11936b166d55d72496da16626f1e1e87fa9ce9483ba52b461a8c4bb86c2e2a04')

prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  # replace upper version boundaries for ruby gems
  sed --in-place 's|~>|>=|g' "${_gemname}.gemspec"

  patch --verbose --strip=1 --input="../${pkgname}_remove-rubocop.patch"
}

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  rake test
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 CHANGELOG.md CONTRIBUTING.md CONTRIBUTORS.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:

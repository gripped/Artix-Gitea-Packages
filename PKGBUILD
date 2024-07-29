# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname=async
pkgname=ruby-${_gemname}
pkgver=2.10.2
pkgrel=1
pkgdesc='Composable asynchronous I/O'
url='https://github.com/socketry/async'
arch=('any')
license=('MIT')
depends=(
  ruby
  ruby-console
  ruby-nio4r
  ruby-timers
)
makedepends=(
  ruby-rdoc
)
options=('!emptydirs')
source=("https://github.com/socketry/async/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8e8804ad60f68c4a7238e62e27ace99108e29fe134c8fafd00705840edf6a353c4c4d3baeda149b5dddeaca678e62fedb5499da57d5f492726b29dcd0502a0d9')
b2sums=('2460f63a0963f0cd64ac3c23edf3398539dee9721817a59dd55baf5db01e887a5127d9e10413168550e1c4f89d4b2b14d503701c97f5a9518af449975c8ad640')

prepare() {
  cd ${_gemname}-${pkgver}

  sed --in-place 's|git ls-files|find|' "${_gemname}.gemspec"
  sed --in-place 's|~>|>=|g' "${_gemname}.gemspec"
  sed --in-place '/release\.pem/d' "${_gemname}.gemspec"
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  install -Dm 644 readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 license.md -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgdir}/${_gemdir}"
  rm -rf cache gems/${_gemname}-${pkgver}/{ext,lib/*/*.so} \
    extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}

# vim: ts=2 sw=2 et:

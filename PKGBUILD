# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='erb'
pkgname="ruby-${_gemname}"
pkgver=4.0.4
pkgrel=2
pkgdesc='An easy to use but powerful templating system for Ruby'
arch=('x86_64')
url="https://github.com/ruby/${_gemname}"
license=(
  BSD-2-Clause
  Ruby
)
depends=(
  glibc
  ruby
  ruby-cgi
)
makedepends=(
  tree
)
checkdepends=(
  ruby-rake
  ruby-rake-compiler
)
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ee3b138db13a90825e00e94a285e5a53a46e154639fa05a6c8018560463f966709fb358d9f64936749049e19055c6a67d808d5fc844a797630e18e2a669ca6a3')
b2sums=('b6982aa4f95188566eb9490d1d5adf0c55963797d4942c2d163162c2e4161b6a48aa9227100490b4dc8d17bd920b07828208ca85b9ae7d736895a818f90670ac')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  # we build based on a tar archive, not a git repo
  sed --in-place --regexp-extended 's|git ls-files -z|find . -type f -not -path "*/\.git*" -printf "%P\\\\0"|' "${_gemname}.gemspec"
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

  install --verbose -D --mode=0644 LICENSE* --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:

# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=ruby-tins
_pkgname="${pkgname#ruby-}"
pkgver=1.63.0
pkgrel=1
pkgdesc='All the stuff that is not good/big enough for a real library'
arch=(any)
url='https://github.com/flori/tins'
license=(MIT)
depends=(ruby ruby-bigdecimal ruby-sync ruby-mize)
makedepends=(git ruby-rake)
options=(!emptydirs)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('70d98afe2311066899d5e426899912cd5d6b61b849996b84ae897fffee4b08e8303e4a4508b564175bf7e8939c75695a5e639202f8ff4e4d5a3806b7ac59e8cc')
b2sums=('2ff6c25515468c630e6f672a506d1772939f5b65ec1f8ca887569c98aa836d630c6a5f81d651d997e45fba0887a4b5d2c4eccaf15c5303d0bcd80ab453c85700')

prepare() {
  cd "$pkgname"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' tins.gemspec
}

build() {
  cd "$pkgname"

  gem build tins.gemspec
}

package() {
  cd "$pkgname"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_pkgname-$pkgver.gem"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

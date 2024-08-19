# Maintainer: artist for Artix Linux

_module='extramenu'
pkgname="moksha-module-${_module}"
_fullmodule="enlightenment-module-${_module}"
pkgver=0.0.1
pkgrel=1.1
pkgdesc="Add custom menus to the enlightenment main menu. Look at the README file for instructions."
_group=('moksha-modules-extra')
arch=('x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('efl>=1.23.99')
makedepends=('git' 'meson>=0.58.0' cmake moksha efl)
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-git")
source=("git+http://git.enlightenment.org/enlightenment/$_fullmodule.git"
        "10_pkg_version.diff"
        "include-config.patch")
sha256sums=('SKIP'
            'df1f19d90ebb00269bc0fee54006b69c17c27e487f495677c4156ce6ad7b5cfc'
            '2918daaef648084b681fae9c630855c91635209bebbacd72f3360a70e7972e60')

prepare() {
  cd "$srcdir/$_fullmodule"
  patch -Np1 -i ../10_pkg_version.diff
  patch -Np1 -i ../include-config.patch
}

build() {
  cd "$srcdir/$_fullmodule"
  meson --prefix=/usr . build
  meson configure build
  ninja -C build
}

package() {
  cd "$srcdir/$_fullmodule"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}


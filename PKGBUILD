# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: arkhan <arkhan@disroot.org>

pkgname=ueberzug
pkgver=18.3.1
pkgrel=5.1
pkgdesc='Command line util which allows to display images in combination with X11'
arch=('x86_64')
url=https://github.com/ueber-devel/ueberzug
license=('GPL-3.0-or-later')
options=(!lto)
depends=(
    'libxext'
    'libxres'
    'python-attrs'
    'python-docopt'
    'python-pillow'
)
makedepends=(
    'meson-python'
    'python-build'
    'python-installer'
    'python-wheel'
)
provides=("python-$pkgname")
replaces=("python-$pkgname")
# upstream has not tagged a new release yet; pin to the commit that fixes
# Python 3.14 compatibility, see https://github.com/ueber-devel/ueberzug/pull/34
_commit=7a3abad749c6e328794a39664ddcc7bc4bea5dd9
source=("$pkgname-$pkgver-$_commit.tar.gz::https://github.com/ueber-devel/ueberzug/archive/$_commit.tar.gz")
sha256sums=('4fb55bcb75a0c12cd8c89832c4e1bdcc97580c1a7575dd621b930f54b067bf0f')
b2sums=('627f5eb9b698ffc2045f41fbaee92ef0dd5c25be64b9f9da2e3b294a3789933df7778de25c7df2eab70536c9ba9198f51c3f878a56b03dc69792ab92e6ab7e46')

build() {
    cd $pkgname-$_commit
    # set a fixed build dir to fix repro issue, see
    # https://github.com/mesonbuild/meson-python/issues/703 for details
    python -m build --wheel --no-isolation -Cbuild-dir=build
}

package() {
    cd $pkgname-$_commit
    python -m installer --destdir="$pkgdir" dist/*.whl
}

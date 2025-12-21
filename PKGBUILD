# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-mediafile
pkgver=0.13.0
pkgrel=2
pkgdesc='Elegant audio file tagging'
arch=(any)
url=https://github.com/beetbox/mediafile
license=(MIT)
depends=(
  python-mutagen
  python-filetype
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
source=("$pkgname::git+https://github.com/beetbox/mediafile#tag=v$pkgver")
sha512sums=('a600afb0b8378506578895d99193fe202ce6f76d531c72fd14b81adea6b9b1cd7063afe86997e78d06306cade981cf0172dca6d004d8057009d38cfb44d93045')
b2sums=('97a4cdf2c2ec0228caf0838d3d495cd0d0ec8f6dbd68aa50d7286fcf3bc099e72194e03c5c421fdef49b6f5cd091f3d656a05d4cf3034c851ed7a35cf53634e6')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover -vs .
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
 

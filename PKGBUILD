# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-mediafile
pkgver=0.16.2
pkgrel=1
pkgdesc='Elegant audio file tagging'
arch=(any)
url='https://github.com/beetbox/mediafile'
license=(MIT)
depends=(
  python
  python-mutagen
  python-filetype
)
makedepends=(
  git
  python-build
  python-poetry-core
  python-installer
)
checkdepends=(python-pytest)
source=("$pkgname::git+https://github.com/beetbox/mediafile#tag=v$pkgver")
sha512sums=('606cd7cb1b56086e1a9ac98ebdb9e23f9dc1b4dfd223c4b0cf4bd7370a575c874c529fcaf250459988e585e6e7e05dd6cc82838bcbff2f84fac8b6fa76878295')
b2sums=('e2623bfeaa69bee6623deb423ac9b0c4439e7efde61ca1843be9fdf714bbb5762023c77992ffe004f5edd59254e0980a3088b831740b9ce635e8c0efc77d15d6')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:

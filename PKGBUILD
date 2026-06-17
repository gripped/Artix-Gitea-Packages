# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-svglib
_name="${pkgname#python-}"
pkgver=2.0.0
pkgrel=1
pkgdesc="Read SVG files and convert them to other formats"
arch=(any)
url="https://github.com/deeplook/svglib"
license=(LGPL-3.0-only)
depends=(
  python
  python-lxml
  python-pillow  # used directly, but pulled in by python-reportlab: https://github.com/deeplook/svglib/issues/463
  python-reportlab
  python-tinycss2
  python-cssselect2
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('8ce5e187ec3e25634a51a081219d98e882363139abf0046933a1ff188ed020220f8c64ec8aefb0f7993db1c959cf3b43fc3a22f36fb335e821455f37ec6727f9')
b2sums=('d72a14cf74049a870d9c3bd875dfd46ef2614bd7878d5246047e7f08c23a2836ce36757128d92856e891e2d70c1f3111905b744e053de11a0f2758a54287eb4a')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable tests that need remote resources
    --ignore tests/test_samples.py
  )

  cd $_name-$pkgver
  export PYTHONPATH="src:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,CONTRIBUTORS,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

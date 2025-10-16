# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: minder

pkgname=python-pillow
pkgver=12.0.0
pkgrel=1
pkgdesc='Python Imaging Library (PIL) fork'
arch=(x86_64)
url='https://pillow.readthedocs.io'
license=(MIT-CMU)
depends=(
  glibc
  python
  python-packaging
  freetype2
  lcms2
  libavif
  libraqm
  libtiff
  openjpeg2
  libjpeg-turbo
  libimagequant
  libxcb
  zlib
)
makedepends=(
  git
  pybind11
  python-build
  python-installer
  python-wheel
  python-setuptools
  libwebp
  tk
)
checkdepends=(
  python-pytest
  python-pytest-timeout
)
optdepends=(
  'libwebp: for webp images'
  'tk: for the ImageTK module'
  'python-olefile: OLE2 file support'
  'python-pyqt6: for the ImageQt module'
  'python-defusedxml: for reading XMP tags'
)
source=(
  "$pkgname::git+https://github.com/python-pillow/Pillow#tag=$pkgver"
)

prepare() {
  cd "$pkgname"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/python-pillow/-/issues/3
  # Added has_feature_version
  git cherry-pick -n 54f4a346ef89e33eec0f889569a6d280eca70656
  # Updated tests for FreeType 2.14.1
  git cherry-pick -n 92e671d7970b8f96c50424c0c47efd0a1c95bc51
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python selftest.py
  test-env/bin/python -m pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  install -vDm644 -t "$pkgdir/usr/include/python$python_version" src/libImaging/*.h

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
sha256sums=('SKIP')

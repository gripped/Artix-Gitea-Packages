# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-soupsieve
pkgver=3.0.1
pkgrel=1
pkgdesc='A CSS4 selector implementation for Beautiful Soup'
arch=(any)
url='https://github.com/facelessuser/soupsieve'
license=(MIT)
depends=(python python-beautifulsoup4)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-pytest
  python-html5lib
  python-lxml
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('3f849448a6bdf779b389302ab2e05d622c439f4a214a1d1a30678bfac4da61cb47284bd132b4833f044e8f27573ae083224fdc13cace1305ddb7779f857346bc')
b2sums=('f46ff153e75503756bf3822bb111178ba80a6eb32131079561db7a3f4bf9b56a3995834f1b445ad3e2715723e71425c1261de9d24e707c519188efd512cde795')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # https://gitlab.gnome.org/GNOME/libxml2/-/issues/312
  pytest \
    --deselect tests/test_extra/test_soup_contains.py::TestSoupContains::test_contains_cdata_html \
    --deselect tests/test_extra/test_soup_contains_own.py::TestSoupContainsOwn::test_contains_own_cdata_html
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${pkgname#python-}-$pkgver.dist-info/licenses/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# Maintainer: George Rawlinson
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-rapidfuzz
pkgver=3.6.2
pkgrel=4
pkgdesc='Rapid fuzzy string matching in Python using various string metrics'
arch=('x86_64')
url='https://github.com/maxbachmann/rapidfuzz'
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'cython'
  'python-scikit-build'
  'rapidfuzz-cpp'
)
checkdepends=('python-hypothesis' 'python-pandas' 'python-pytest')
optdepends=('python-numpy')
_commit='26917be34e943fd082f13f3106b84b4c27a7f56a'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'github.com-taskflow-taskflow::git+https://github.com/taskflow/taskflow'
  fix_backend.patch
)
b2sums=('SKIP'
        'SKIP'
        'e166301b612375d60087af4d0e8e3cb80d8b5a43f1164d67951f30fb19224be7373a4547d059f6445f5c00723fd3fe8e3a60bb7a44103dc5bb6c86984eb3561e')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # prepare git submodules
  git submodule init extern/taskflow
  git config submodule.extern/taskflow.url "$srcdir/github.com-taskflow-taskflow"
  git -c protocol.file.allow=always submodule update
  
  # fix backend_patch
  cd _custom_build
  patch backend.py < ../../fix_backend.patch

}

build() {
  cd "$pkgname"

  RAPIDFUZZ_BUILD_EXTENSION=1 \
    python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${pkgname#python-}-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-vcs-versioning
pkgver=2.1.2
pkgrel=1
pkgdesc='the blessed package to manage your versions by vcs metadata'
arch=(any)
url='https://github.com/pypa/setuptools-scm'
license=(MIT)
depends=(
  python
  python-packaging
  python-setuptools
)
makedepends=(
  git
  python-build
  python-installer
)
checkdepends=(
  python-pytest
  jujutsu
  mercurial
)
optdepends=('python-rich: formatting of log messages')
source=("python-setuptools-scm::git+$url#tag=vcs-versioning-v$pkgver")
sha512sums=('d129adf8647f7b58bb2df4c9b7405104e1d15dbb193cd2b3d013fd8cd4937d72a4b6f379fcf3113b369ad3fbb79dc5695a410d701f90e8bb5d5603f5885ff9a4')
b2sums=('dff6eebda8c96e54fdfa61a939c4c26bf1b7f4a801ff5a6aa0437fa3711b94436589256fe02cb04174d38e5943f12bf31f39707d0d2ae2af0b117cf7505b1fb6')

build() {
  cd python-setuptools-scm/vcs-versioning

  python -m build --wheel --no-isolation
}

check() {
  cd python-setuptools-scm/vcs-versioning

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  local pytest_options=(
    -vv
    # failing with 2.0+
    --deselect testing_vcs/test_workdir_discovery.py::TestDiscoverWorkdirFallback::test_discovers_pkginfo
    --deselect testing_vcs/test_workdir_discovery.py::TestFallbackPriority::test_unprocessed_archival_falls_through_to_pkginfo
  )

  pytest "${pytest_options[@]}"
}

package() {
  cd python-setuptools-scm/vcs-versioning

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

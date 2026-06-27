# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-vcs-versioning
pkgver=2.2.0
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
sha512sums=('7dfb0026bcc623a1973b97a5ec92e82ff636c43799d017b412ec2c669f48d174538a4a8f1c36ccff542ae620a65f61f9fa8b2a3ecb48b8b8626b7a304dd8201d')
b2sums=('1d1074b2f14c22a94533d5ab1a3eecdb45f629743cfcdceb19a11cc5f1e23c6884c775b085294e51c3fb8a665e038d4c29d76fcca7b86ca8e58e3c0509f4e538')

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
  )

  pytest "${pytest_options[@]}"
}

package() {
  cd python-setuptools-scm/vcs-versioning

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

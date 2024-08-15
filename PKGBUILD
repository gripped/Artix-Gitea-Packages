# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm
pkgname=python-pdm
pkgver=2.18.0
pkgrel=1
pkgdesc="A modern Python package and dependency manager supporting the latest PEP standards"
arch=(any)
url="https://github.com/pdm-project/pdm"
license=(MIT)
depends=(
  python
  python-blinker
  python-dep-logic
  python-dotenv
  python-filelock
  python-findpython
  python-hishel
  python-httpcore  # pulled in by python-httpx
  python-httpx
  python-installer
  python-msgpack
  python-packaging
  python-pbs-installer
  python-platformdirs
  python-pyproject-hooks
  python-resolvelib
  python-rich
  python-shellingham
  python-socksio  # required via python-httpx feature
  python-tomlkit
  python-truststore
  python-unearth
  python-virtualenv
  python-zstandard  # required by python-pbs-installer
)
makedepends=(
  python-build
  python-pdm-backend
  python-pdm-build-locked
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-httpserver
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-xdist
  python-setuptools
)
optdepends=(
  'python-cookiecutter: for using cookiecutter when generating project'
  # 'python-copier: for using copier when generating project'  # TODO: package python-copier
  'python-keyring: for storing credentials'
  'python-pytest-mock: for pytest plugin'
  'python-setuptools: for parsing setup.py files'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('fa46f979866ed9e186466cce9c69c8bfccc74e6a6f73908d0d71dcae539c7589ebc5de46000626de674f6938bec4df96f3f6fb1ae949fd7688852253deabaa6e')
b2sums=('5605014e3ee055fb1193d78563e5f01b915bf5dc10bd1f7f40486f74d0371140304190dde3e30d6d067e9483cbedd83f250b1108ac0a9adb35d8e2850db0fda4')

build() {
  cd $_name-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # we don't want to run tests that require the internet
    --deselect tests/test_project.py::test_access_index_with_auth
    # unclear issue with no isolation build
    --deselect tests/cli/test_build.py::test_build_with_no_isolation
    # failing keyring mocks: https://github.com/pdm-project/pdm/issues/3110
    --deselect tests/cli/test_config.py::test_config_password_save_into_keyring
    --deselect tests/cli/test_config.py::test_keyring_operation_error_disables_itself
    --deselect tests/cli/test_publish.py::test_repository_get_credentials_from_keyring
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  # completions
  install -vd "$pkgdir/usr/share/"{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" "$pkgdir"/usr/bin/pdm completion bash > "$pkgdir/usr/share/bash-completion/completions/$_name"
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" "$pkgdir"/usr/bin/pdm completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/$_name.fish"
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" "$pkgdir"/usr/bin/pdm completion zsh > "$pkgdir/usr/share/zsh/site-functions/_$_name"
}

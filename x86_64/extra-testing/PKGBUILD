# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm
pkgname=python-pdm
pkgver=2.8.0
pkgrel=1
pkgdesc="A modern Python package manager with PEP 582 support"
arch=(any)
url="https://github.com/pdm-project/pdm"
license=(MIT)
depends=(
  python
  python-blinker
  python-cachecontrol
  python-certifi
  python-dotenv
  python-findpython
  python-installer
  python-lockfile  # required optdepends of python-cachecontrol
  python-packaging
  python-pdm-backend
  python-platformdirs
  python-pyproject-hooks
  python-requests  # required by python-requests-toolbelt
  python-requests-toolbelt
  python-resolvelib
  python-rich
  python-shellingham
  python-tomlkit
  python-unearth
  python-urllib3  # required by pdm/models/session.py
  python-virtualenv
)
makedepends=(
  python-build
  python-wheel
)
checkdepends=(
  python-setuptools
  python-pytest
  python-pytest-httpserver
  python-pytest-mock
)
optdepends=(
  'python-keyring: for storing credentials'
  'python-pytest-mock: for pytest plugin'
  'python-setuptools: for parsing setup.py files'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('e0f600f509684a3b4e039e17fc301ae88ba99c4c9cbb521fd32c1bac19d6cad61bc89c0171ac8bdd1ae9e23d49443b279ba6eacb2f7154d2889ceac0fdd4c722')
b2sums=('bdfa59a4a3ed33e5e1e42f5f74db83bb8b5286bba9524ebf5f6bfd7ac9f3a75bb9a2a6dde222363322e53d1d8f84a5dc2b784f5f7d78f79b94dec6bf0ad4ccb9')

build() {
  cd $_name-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect tests/test_utils.py::test_find_python_in_path
    # https://github.com/pdm-project/pdm/issues/1831
    --deselect tests/cli/test_others.py::test_build_distributions
    # we don't want to run tests that require the internet
    --deselect tests/test_project.py::test_access_index_with_auth
    # https://github.com/pdm-project/pdm/issues/2107
    --deselect tests/cli/test_hooks.py::test_hooks
    --deselect tests/cli/test_hooks.py::test_skip_all_option_from_signal
    --deselect tests/cli/test_hooks.py::test_skip_option_from_signal
    --deselect tests/cli/test_hooks.py::test_skip_pre_post_option_from_signal
    --deselect tests/cli/test_run.py::test_pep582_launcher_for_python_interpreter
    --deselect tests/models/test_candidates.py::test_cache_vcs_immutable_revision
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  # completions
  install -vd "$pkgdir/usr/share/"{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}
  "$pkgdir"/usr/bin/pdm completion bash > "$pkgdir/usr/share/bash-completion/completions/$_name"
  "$pkgdir"/usr/bin/pdm completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/$_name.fish"
  "$pkgdir"/usr/bin/pdm completion zsh > "$pkgdir/usr/share/zsh/site-functions/_$_name"
}

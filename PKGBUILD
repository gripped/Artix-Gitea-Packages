# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic-settings
pkgname=python-pydantic-settings
pkgver=2.10.0
pkgrel=1
pkgdesc="Settings management using pydantic"
arch=(any)
url="https://github.com/pydantic/pydantic-settings"
license=(MIT)
depends=(
  python
  python-dotenv
  python-pydantic
  python-pydantic-core  # directly used, but transitive dependency of python-pydantic
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-pytest-examples
  python-pytest-mock
  # TODO: add python-azure-keyvault-secrets and python-azure-identity for azure-key-vault optdepend
)
optdepends=(
  'python-pyyaml: for YAML support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('8ceabcddcfc3f4fdfa54d94f7fda2cd48a28336ee71efa3fc184aaeda0d339463b840ef41237e5e77ad81005b86a5d7fceef32de7cd223a853ba148a342ba471')
b2sums=('630f2a322bcc1fae3e43bb9da8237406df5d9561b65a1cb595df5ffce764a54e8429748e1f96129746a1393e11103884e4e01eebd3e7eea74deecc77750e5266')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # we are not interested in linting and formatting
    --ignore tests/test_docs.py
    # we don't yet have azure integration in the repos
    --ignore tests/test_source_azure_key_vault.py
    # we don't yet have gcp integration in the repos
    --ignore tests/test_source_gcp_secret_manager.py
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
}

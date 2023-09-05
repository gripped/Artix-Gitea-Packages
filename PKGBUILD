# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=molecule
pkgver=6.0.1
pkgrel=1
pkgdesc="Aids in the development and testing of Ansible roles"
arch=(any)
url="https://github.com/ansible-community/molecule"
license=(MIT)
depends=(
  python
  python-ansible-compat
  python-click
  python-click-help-colors
  python-cookiecutter
  python-enrich
  python-jinja
  python-jsonschema
  python-packaging
  python-pluggy
  python-pyyaml
  python-rich
  python-wcmatch
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  ansible
  check-jsonschema
  python-ansi2html
  python-filelock
  python-pexpect
  python-pytest
  python-pytest-mock
  python-pytest-testinfra
  python-pytest-xdist
  yamllint
)
optdepends=(
  'ansible: for the ansible verifier'
  'molecule-docker: for the docker driver'
  'molecule-podman: for the podman driver'
  'molecule-vagrant: for the vagrant driver'
  'python-pywinrm: for Windows support'
  'python-pytest-testinfra: for the testinfra verifier'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('b354d9ff8b64617322e02d00bea4daf52c9a308876dd6c9ea5ec3a6bd94349cfc8b85e9dcc581744bb75a446f9b0ba962c755aec6387b0ef4b1d042918c0072b')
b2sums=('ee0109c4f2586de47d3b7fe88138fb5916988e3e97e7f31f725abe926c5442344300ffb92075bad7af13aeee500a30ee014251b67455ac6058765ae699a25ff1')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd $pkgname-$pkgver

  # install into test location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  export PATH="test_dir/usr/bin:$PATH"
  pytest -v "test_dir/$site_packages/molecule/test/a_unit/" -c /dev/null
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

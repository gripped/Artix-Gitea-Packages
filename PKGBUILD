# Maintainer: David Runge <dvzrv@archlinux.org>

_bootstrap=1
_bootstrap_version=3.13.0
pkgname=python-pyproject-hooks
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=2
pkgdesc="A low-level library for calling build-backends in pyproject.toml-based project"
arch=(any)
url="https://github.com/pypa/pyproject-hooks"
license=(MIT)
depends=(python)
if (( _bootstrap == 0 )); then
  makedepends=(
    python-build
    python-installer
    python-flit-core
    python-wheel
  )
else
  makedepends=(
    git
  )
fi
checkdepends=(
  python-pytest
  python-setuptools
  python-testpath
)
if (( _bootstrap == 0 )); then
  source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
else
  source=(
    python-bootstrap::git+https://gitlab.archlinux.org/archlinux/python-bootstrap.git#tag=$_bootstrap_version
    python-build::git+https://github.com/pypa/build.git
    python-flit::git+https://github.com/pypa/flit.git
    python-installer::git+https://github.com/pypa/installer.git
    python-wheel::git+https://github.com/pypa/wheel.git
    python-packaging::git+https://github.com/pypa/packaging
    python-pyproject-hooks::git+https://github.com/pypa/pyproject-hooks
    python-setuptools::git+https://github.com/pypa/setuptools.git
  )
fi
sha512sums=('5757ae70da9b52c571e4cd65585ec7ab4f7471eec7bf261a0d8dd2a5429284cfbe2a471292f7479d7c6c82c94ec846615cd382aa6c574d6be79dd9becc83a2ec'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
b2sums=('735732dab41dd5f16f7f0536f393f5c2b07a5a444b7541c6875f16b701bd8bee9f19220dcc8d112ed821e03b2705b50789d1ccbdd36eb755a3346ddfe7a39a56'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  if (( _bootstrap == 0 )); then
    cd $_name-$pkgver
  else
    cd python-bootstrap
    git submodule init

    git config submodule."external/build".url ../python-build
    git config submodule."external/flit".url ../python-flit
    git config submodule."external/installer".url ../python-installer
    git config submodule."external/wheel".url ../python-wheel
    git config submodule."external/packaging".url ../python-packaging
    git config submodule."external/pyproject-hooks".url ../python-pyproject-hooks
    git config submodule."external/setuptools".url ../python-setuptools

    git -c protocol.file.allow=always submodule update
    git submodule update --init --recursive
  fi
}

build() {
  if (( _bootstrap == 0 )); then
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
  else
    cd python-bootstrap
    python -m bootstrap.build
  fi
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="$PWD/src:$PYTHONPATH"
  pytest -vv
}

package() {
  if (( _bootstrap == 0 )); then
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  else
    cd python-bootstrap
    python -m bootstrap.install dist/${_name/-/_}-*-py3-none-any.whl -d "$pkgdir"
    install -vDm 644 external/$_name/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  fi
}

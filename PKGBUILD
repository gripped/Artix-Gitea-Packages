# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

_name=PyYAML
pkgname=python-yaml
pkgver=6.0.1
pkgrel=1
pkgdesc='Python bindings for YAML, using fast libYAML library'
arch=(x86_64)
url='https://github.com/yaml/pyyaml'
license=(MIT)
depends=(
  glibc
  libyaml
  python
)
makedepends=(
  cython0
  python-build
  python-installer
  python-setuptools
  python-wheel
)
provides=(python-pyyaml)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('94a29924484f557c0966d485c2b70232909253f27fcea9b89e1db1462abf61f2f85d55fbae0177b2bed70eb5daa75813551e868df4df4cddfdee9a87bd08485f')
b2sums=('0baec52a7aeede68dcddaf4c0a8fc39533287f3b65d0f6bcfc87ef2dbad347793b975e2fd6abd455f160dd4f62d9034288033b9b0c7d07269c6c588e5f20f8c1')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation --config-setting=--with-libyaml
}

check() {
  local _py_ver="$(python3 -c "import sys; print(str(sys.version_info.major)+str(sys.version_info.minor))")"

  cd $_name-$pkgver
  export PYTHONPATH="tests/lib:build/lib.linux-$CARCH-cpython-$_py_ver:$PYTHONPATH"
  python -m tests.lib.test_all
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm 644 CHANGES README.md -t "$pkgdir"/usr/share/doc/$pkgname/
}

# vim: ts=2 sw=2 et:

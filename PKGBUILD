# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

pkgname=python-xxhash
pkgver=3.8.0
pkgrel=1
pkgdesc='Python binding for xxHash'
arch=(x86_64)
url="https://github.com/ifduyue/$pkgname"
license=(BSD-2-Clause)
depends=(
    glibc
    python
    xxhash
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools-scm
    python-wheel
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('79821d7c3566ae6d53f5dea921b0f1085362e159a77e8b7fa70dce74cc9758e22f34d6c3c632feea4592b3fcaab9957c0e0750267f09befd4effe2632a9d753e')

prepare() {
    # benchmark imports pytest, all other tests rely on the unittest module
    rm $pkgname/tests/test_benchmark.py
}

build() {
    cd $pkgname
    # link to xxHash
    XXHASH_LINK_SO=1 \
    python -m build --wheel --no-isolation
}

check() {
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer $pkgname/dist/*.whl
    test-env/bin/python -m unittest discover -vs $pkgname/tests
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

pkgname=python-xxhash
pkgver=3.7.1
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
b2sums=('81363fd837bc3c35f623c470043df87be8630de84f91ffe4b1e3438ca75c32dd01769ecc2e69bc0f2c8e6cd804c52da609fc9c5e03a01e234f7ad62362b0160b')

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

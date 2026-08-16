# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

pkgname=python-xxhash
pkgver=4.0.0
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
source=("$pkgname::git+$url.git#tag=v$pkgver"
        test_interpreters.patch)
b2sums=('b7b4d1ff403f8df85934a212032ccff876b7900b55947b858d9bdfed993dd4a73a5257b75c52d6a1d876d28a9b74c29356c39c1c9d2084982cd50cc7748a89c8'
        'e0f340fc85ab1726f7b8fca1473dfc2cf576574d90799db7e4f20010df1d24c4d17e47b7dedaf79a3aa5f9ba52f4acebd06cd0755934c1acc1ead5bc55ba459e')

prepare() {
    # benchmark imports pytest, all other tests rely on the unittest module
    rm $pkgname/tests/test_benchmark.py
    # we are not testing typing annotations
    rm $pkgname/tests/test_stubs_pyright.py

    # avoid messing with sys.path in tests (breaks importing xxhash installed in test-env)
    cd $pkgname
    patch -p1 < ../test_interpreters.patch
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

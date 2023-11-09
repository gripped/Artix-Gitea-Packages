# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpcore
pkgname=python-httpcore
# https://github.com/encode/httpcore/blob/master/CHANGELOG.md
pkgver=1.0.1
pkgrel=1
pkgdesc="A minimal HTTP client"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python' 'python-h11' 'python-certifi')
optdepends=(
  'python-h2: for HTTP/2 support'
  'python-socksio: for SOCKS support'
  'python-anyio: for asyncio backend'
  'python-trio: for trio backend'
  # Used but not listed in pyproject.toml. Probably upstream relies on transitive dependency anyio -> sniffio
  'python-sniffio: for async support'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-fancy-pypi-readme'
             'python-h2' 'python-socksio' 'python-trio' 'python-anyio' 'python-sniffio')
checkdepends=('python-pytest-httpbin' 'python-pytest-trio')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('2ad177bfc4523f659e5cfac5d61c464b964192856e4c84b253e85ead47631f9aedee5248e962899248f7b745783a0bc746024310841cc844a78ba52ea1637c44')

prepare() {
    cd ${_pkgname}-${pkgver}

    # disable -Werror, which often causes failures due to newer dependencies in Arch
    sed -i '/filterwarnings/d' pyproject.toml
}

build() {
    cd ${_pkgname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${_pkgname}-${pkgver}

    # raise open files limits, many tests will fail otherwise
    ulimit -S -n 4096

    python -m pytest
}

package() {
    cd ${_pkgname}-${pkgver}

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}

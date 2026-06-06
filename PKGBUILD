# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-tqdm
pkgver=4.68.0
pkgrel=1
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL-2.0')
url='https://github.com/tqdm/tqdm'
depends=('python')
optdepends=('python-requests: telegram')
makedepends=('git' 'python-setuptools-scm' 'python-toml' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-timeout' 'python-numpy' 'python-pandas' 'python-rich' 'python-dask' 'tk')
source=("git+https://github.com/tqdm/tqdm.git#commit=v${pkgver}")
sha512sums=('82acef1e0096bbf70a4ec5ac54d22159b43ea48678180e88f29e69b2edfb29414753fdb6388211b7383ceb658d44aedc707ba0c190e22eea4ae19034f024bf8f')

build() {
  cd tqdm
  python -m build --wheel --no-isolation
}

check() {
  cd tqdm
  # Tests still require numpy < 2.x.x
  #pytest
}

package() {
  cd tqdm
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  install -Dm 644 tqdm/completion.sh "${pkgdir}/usr/share/bash-completion/completions/tqdm"
}

# vim:set ts=2 sw=2 et:

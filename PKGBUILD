# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-pool
# source is shared with python-psycopg package, hence the weird naming
_pkgname=python-psycopg
pkgver=3.2.8
pkgrel=1
pkgdesc='Connection pool for psycopg'
arch=('any')
url='https://www.psycopg.org/psycopg3/'
license=('LGPL-3.0-only')
depends=('python' 'python-psycopg')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$_pkgname::git+https://github.com/psycopg/psycopg.git#tag=pool-$pkgver")
sha512sums=('b2f1d164277cbc4b53f54ec9e9c8c476abdbe2551e6c9ee9bf1ddfe771d670b61cb05fabbc25aea1065656288548c8e7c46faad205c288cf996342d9684a4638')
b2sums=('ad8730bb116f3558d473a20b592c901cc2b461e9a00a67a58ce70af4d0d4ef410bffdf01ba755ea96ef8c8e3963f3ebb17f6b3604c4d5ca8acae99a79d5a7738')

build(){
  cd "$_pkgname/psycopg_pool"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname/psycopg_pool"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

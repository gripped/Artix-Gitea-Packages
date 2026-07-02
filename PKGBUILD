# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: dnuux <dnuuxx@gmail.com>

pkgname=python-faker
pkgver=40.24.0
pkgrel=1
pkgdesc='Faker generates fake data for you.'
arch=('any')
url='https://faker.readthedocs.io/en/master/'
license=('MIT')
depends=('python')
optdepends=('python-xmltodict: for xml provider')
makedepends=('git' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-wheel')
checkdepends=('python-validators' 'python-ukpostcodeparser' 'python-freezegun' 'python-pillow'
              'python-xmltodict')
source=("git+https://github.com/joke2k/faker.git#tag=v$pkgver")
sha512sums=('fcb7e7b2041db753c82b6eca6d755d121861a8ac38921e8dde7f463708818d0f99cec6f767cbb37743df56f6704dedcc54f3b746ae910bbf4297ec9b900b2ddb')

build() {
  cd faker
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd faker
  python setup.py egg_info
  python -m pytest
}

package() {
  cd faker
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/faker-$pkgver.dist-info/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

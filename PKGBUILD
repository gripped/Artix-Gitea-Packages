# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-pycryptodome
pkgver=4.0.1
pkgrel=1
license=('BSD-2-Clause' 'Unlicense')
arch=('x86_64')
pkgdesc="Collection of cryptographic algorithms and protocols, implemented for use from Python 3."
url='https://www.pycryptodome.org/'
depends=('python' 'glibc')
makedepends=('git' 'python-'{build,installer,wheel} 'python-setuptools')
checkdepends=('python-pytest')
conflicts=('python-crypto')
provides=('python-crypto')
replaces=('python-crypto')
source=("git+https://github.com/Legrandin/pycryptodome.git#tag=v$pkgver")
sha512sums=('36efb3233150c73f356a5e7a242dd812fa4df39b85c1374211f1116944699a78024c8ae9f2850d10388b7658dd479d2d99bd903d6bc5285863a85101f66c7ef5')

build() {
  cd pycryptodome
  python -m build -wn

  cd test_vectors
  python -m build -wn
}

check() {
  cd pycryptodome
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer test_vectors/dist/*.whl
  test-env/bin/python -m Crypto.SelfTest
}

package() {
  cd pycryptodome
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname/

  rm -r "$pkgdir"/usr/lib/python3.*/site-packages/Crypto/SelfTest/
}

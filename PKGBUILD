# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-pycryptodome
pkgver=4.5.0
pkgrel=1
license=('BSD-2-Clause' 'Unlicense' 'MIT')
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
sha512sums=('4f6cabbfc7e9746ff1563cfbec369efa29779a340caabba048d6cf2eacafdd213de3e4a70fe7f07dc9d94dc94426e9b931a802536629de4f821aaa890854e8e2')

build() {
  cd pycryptodome
  python -m build -wn

  cd test_vectors
  python -m build -wn
}

check() {
  cd pycryptodome
  python -m venv --system-site-packages --without-pip test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer test_vectors/dist/*.whl
  test-env/bin/python -m Crypto.SelfTest
}

package() {
  cd pycryptodome
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 src/mldsa-native/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 src/mlkem-native/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.mlkem-native

  rm -r "$pkgdir"/usr/lib/python3.*/site-packages/Crypto/SelfTest/
}

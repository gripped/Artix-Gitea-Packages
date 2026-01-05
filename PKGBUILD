# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgbase=libseccomp
pkgname=(libseccomp python-libseccomp)
pkgver=2.5.6
pkgrel=2
pkgdesc='Enhanced seccomp library'
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/seccomp/libseccomp"
checkdepends=(
  valgrind
)
makedepends=(
  cython
  git
  glibc
  gperf
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(git+https://github.com/seccomp/libseccomp.git#tag=v${pkgver}?signed)
sha256sums=('51b6119c2af35ac40eef2421459b308ec4bf9e4b00d68740a4ede56bd323cf7d')
b2sums=('3cccadb92d2745f9405e4dc06027f1238823dc6cd6bff846c858b49fa5c48591cdde6ed69a989947352ac5066b44c335b2842acca0711b9eb7a338903c023886')
validpgpkeys=(
  '7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A' # Paul Moore <paul@paul-moore.com>
  '47A68FCE37C7D7024FD65E11356CE62C2B524099' # Tom Hromatka <tom.hromatka@oracle.com>
)

prepare() {
  cd ${pkgbase}
  # Fix test failures with gcc 15 and LTO
  # hash: fix strict aliasing UB in MurMur hash implementation
  git cherry-pick -n 614530bc8b3c9f49aa59d7eaef4863b746504c23
  autoreconf -fiv
}

build() {
  cd ${pkgbase}
  ./configure --prefix=/usr
  make
  cd src/python
  env VERSION_RELEASE=${pkgver} python -m build --wheel --no-isolation
}

check() {
  cd ${pkgbase}
  make check
}

package_libseccomp() {
  depends=(glibc)
  provides=(libseccomp.so)
  cd ${pkgbase}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 CHANGELOG README.md SECURITY.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

package_python-libseccomp() {
  depends=(python glibc)
  cd ${pkgbase}/src/python
  env VERSION_RELEASE=${pkgver} python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:

# Maintainer: artist for Artix Linux

pkgname=rdiff-backup
pkgver=2.2.6
pkgrel=1
pkgdesc="Reverse differential backup tool"
url="https://rdiff-backup.net/"
arch=("x86_64")
license=(GPL-2.0-or-later)
depends=(python python-setuptools python-yaml python-psutil librsync)
makedepends=(python-setuptools-scm python-pip asciidoctor)
source=(https://github.com/"${pkgname}"/"${pkgname}"/releases/download/v"${pkgver}"/"${pkgname}"-"${pkgver}".tar.gz)

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  mkdir "${srcdir}"/builddir
  pip install --target="${srcdir}"/builddir --root-user-action=ignore "${pkgname}" -r requirements.txt

  _pkgname=rdiff_backup
  _pkgname2=rdiffbackup
  cd "${srcdir}"/builddir
  install -dm755 "${pkgdir}"/usr/bin
  cp -rp bin/"${pkgname}"* "${pkgdir}"/usr/bin/
  _pyver="$(ls /usr/include/ | grep '^python3*')"
  install -dm755 "${pkgdir}"/usr/lib/"${_pyver}"/site-packages
  cp -rp "${_pkgname}" "${pkgdir}"/usr/lib/"${_pyver}"/site-packages/
  cp -rp "${_pkgname}"-"${pkgver}".dist-info "${pkgdir}"/usr/lib/"${_pyver}"/site-packages/
  cp -rp "${_pkgname2}" "${pkgdir}"/usr/lib/"${_pyver}"/site-packages/
  cp -rp share "${pkgdir}"/usr/
}

sha256sums=('86e2826b784ec3ea4ef187d936ee5f15277422c4077efa0156ef67e3139ea08e')

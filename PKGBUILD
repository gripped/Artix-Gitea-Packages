# Maintainer: artist for Artix Linux

pkgname=rdiff-backup
pkgver=2.2.6
pkgrel=3.1
pkgdesc="Reverse differential backup tool"
url="https://rdiff-backup.net/"
arch=("x86_64")
license=(GPL-2.0-or-later)
depends=(python python-setuptools python-yaml python-psutil librsync)
makedepends=(python-setuptools-scm python-pip asciidoctor)
source=(https://github.com/"${pkgname}"/"${pkgname}"/releases/download/v"${pkgver}"/"${pkgname}"-"${pkgver}".tar.gz)

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"

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

sha256sums=('d0778357266bc6513bb7f75a4570b29b24b2760348bbf607babfc3a6f09458cf')

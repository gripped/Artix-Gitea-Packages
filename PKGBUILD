# Maintainer: dreieck

_pkgname=lact-openrc
pkgname="${_pkgname}"
pkgver=20260823
pkgrel=1.2
pkgdesc='OpenRC init script for lact.'
url="https://github.com/ilya-zlobintsev/LACT"
license=('GPL-3.0-or-later')
arch=('any')
depends=(
  'lact'
  'openrc'
)
backup=('etc/init.d/lact')
options=('!emptydirs')
source=(
  'lact.openrc-init'
  'copying-info.txt'
  'license-gpl3.txt::https://www.gnu.org/licenses/gpl-3.0.txt'
)
sha256sums=('063ed2bc6766aed3502fc43baea93a9cd8de4fa1d65fea3c962b209b0fa27317'
            '55dea4a1301ea1c8dd9cfa7c7eefa6bf90bbf4ca1886c184f8517a6fd6ac6c5f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -D -v -m755 "${srcdir}/lact.openrc-init" "${pkgdir}/etc/init.d/lact"

  for _license in 'copying-info.txt' 'license-gpl3.txt'; do
    install -D -v -m644 "${srcdir}/${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
  done
}

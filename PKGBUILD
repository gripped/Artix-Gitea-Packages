# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Jingbei Li <i@jingbei.li>

pkgname=intel-oneapi-dev-utilities
pkgver=2025.3.1_15
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Intel oneAPI Dev Utilities"
arch=('any')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-eclipse-cfg-${_majmin}-${_pkgver}_all.deb")
b2sums=('6d849687758765fe15517d3c7982a252002c3b8e1156eee8e0f50e363a93d6a123b0c6f017ce86163fe0f8c0df630b76b056e318c26f5c24c3fa0b5aa34c2503'
        '1303ad1880b246cf44c446416097fa92063922acf4218c8e248fec3da3d1bf3b24b80aee44b0652d71f5d11e6aa623f3c36ed09b585ebd28b78a718e3594b98c')
depends=('intel-oneapi-common')
provides=("${pkgname}-eclipse-cfg")
conflicts=('intel-oneapi-basekit')

noextract=(
	"${pkgname}-${_pkgver}_amd64.deb"
	"${pkgname}-eclipse-cfg-${_majmin}-${_pkgver}_all.deb"
)

package() {
  cd "${srcdir}"
  ar x ${pkgname}-${_pkgver}_amd64.deb
  tar xvf data.tar.xz -C "${pkgdir}"
  rm data.tar.xz

  ar x ${pkgname}-eclipse-cfg-${_majmin}-${_pkgver}_all.deb
  tar xvf data.tar.xz -C "${pkgdir}"
  rm data.tar.xz

  local _dev_path='/opt/intel/oneapi/dev-utilities'
  ln -s "${_dev_path}/${_majmin}" "${pkgdir}/${_dev_path}/latest"

  install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}

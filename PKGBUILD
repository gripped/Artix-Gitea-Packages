# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

_pkgname='intel-oneapi'
pkgname="${_pkgname}-common"
pkgver=2025.3.1_15
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Intel's oneAPI common variables and licensing"
arch=('any')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools AND LicenseRef-Intel-Simplified")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-oneapi-vars-${_pkgver}_all.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-licensing-${_majmin}-${_pkgver}_all.deb"
		"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-vars-${_pkgver}_all.deb")
b2sums=('412851b03b7073be063fe511b66d28e93e028835542b40905de51b3fe324c5c378b004aca75599a8d87de6fbd77b54d3c164f4ef8f4543f57b2ccf2db98fa850'
        '3887661ecc2573647cda5453c69b1d6d431ba44076accb3f57f42b6f94a668cd9ebf43197e35eb00c92aef67f5be402eb283686a79b13d790454366e3d1c6679'
        'eea2cef795c4afa823f2dda78aed00b5cdb1e36adcb985b815fd3a3415afa9fce037138ac124dbd1634f9bf61ebd88e3fd7a5cd4ea449a8dfb212336e2a5653f')
depends=('sh')
optdepends=("procps-ng: Sourcing oneapi-vars.sh")
noextract=(
    "${pkgname}-oneapi-vars-${_pkgver}_all.deb"
    "${pkgname}-licensing-${_majmin}-${_pkgver}_all.deb"
    "${pkgname}-vars-${_pkgver}_all.deb"
)
conflicts=('intel-oneapi-basekit')

build() {
    mkdir vars licensing package

}

package() {
    cd "${srcdir}"
    ar x "${srcdir}/${pkgname}-oneapi-vars-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ar x "${srcdir}/${pkgname}-licensing-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ar x "${srcdir}/${pkgname}-vars-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ln -sfT "${_majmin}" "${pkgdir}"/opt/intel/oneapi/licensing/latest
    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /opt/intel/oneapi/licensing/latest "${pkgdir}"/usr/share/licenses/"${pkgname}"/latest
    ln -s "${pkgname}" "${pkgdir}"/usr/share/licenses/"${_pkgname}"
    ls -lah "${pkgdir}"/usr/share/licenses
}

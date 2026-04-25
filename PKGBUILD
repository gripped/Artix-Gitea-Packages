# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Jingbei Li <i@jingbei.li>

pkgname=intel-oneapi-dpcpp-debugger
pkgver=2025.3.1_7
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc='Intel OneAPI GDB'
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb")
b2sums=('ea17b53dded87884b6c105d13054a7e9847be9f90c8d7a90d0e18dcc8cf23646cf1d4b081a45fea3cb121247b1407e8c7edbbacef0d461da2ae08fbea65fa28f')
noextract=(
	"${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
)
depends=('intel-oneapi-common' 'sh' 'glibc' 'gcc-libs' 'zlib' 'libffi')
provides=("$pkgname-eclipse-cfg")
conflicts=('intel-oneapi-basekit')

package() {
    cd "${srcdir}"
    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    local _deb_path='/opt/intel/oneapi/debugger'
    ln -s "${_deb_path}/${_majmin}" "${pkgdir}/${_deb_path}/latest"
    # Allow libs to be found
    local _lib_path='/opt/intel/oneapi/debugger'
    local _ldso_conf="${pkgdir}"/etc/ld.so.conf.d
    install -d "${_ldso_conf}"
    echo "${_lib_path}/latest/debugger/opt/debugger/lib" > "${_ldso_conf}/${pkgname}.conf"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}

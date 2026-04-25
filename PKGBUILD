# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=intel-oneapi-openmp
pkgver=2025.3.3_30
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Intel oneAPI OpenMP runtime library"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-${_majmin}-${_pkgver}_all.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-runtime-openmp-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-runtime-openmp-opencl-shared-${_pkgver}_amd64.deb")
b2sums=('b6b776a0af89499d544a70c8d86fbd6738d77d91410882e02707b4b38881dcd6d937b53df9e15ba0181522f40fcf9164265232dd97f8358f723d236986387fcd'
        'b6b776a0af89499d544a70c8d86fbd6738d77d91410882e02707b4b38881dcd6d937b53df9e15ba0181522f40fcf9164265232dd97f8358f723d236986387fcd'
        'af67d87b3c476815c72e62e21a81f62368f4e3d470f6c12603a41170b267788834d37efc42ec3d890793cc1cbf5785ba4ce913f3870e34b7c834ac4a67408a72'
        '1a06676a863865ba4aeaa8bbd855bd90f6638003c1e9ed6ce3ecce8a08bcf679c1db6cad3ffaf7271281561833f60c6013235eaeeb8e72914bc25c0a8b2aa81e'
        '5aeb3cb0f604c7e381a0c4d7b4257af5cde6919a893e85a98cf82590d762b62f89c1503899a789829819e49704f6115ed4661c28f0c0715136ad2267074b70ab')
depends=('intel-oneapi-common' 'intel-oneapi-tcm' 'sh' 'glibc' 'gcc-libs' 'zlib'
         'libelf' 'level-zero-loader' 'libffi')
noextract=(
    "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    "${pkgname}-common-${_majmin}-${_pkgver}_all.deb"
    "intel-oneapi-runtime-openmp-${_pkgver}_amd64.deb"
    "intel-oneapi-runtime-openmp-opencl-shared-${_pkgver}_amd64.deb"
)
conflicts=('intel-oneapi-basekit')

package() {
    cd "${srcdir}"

    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ar x "${srcdir}/${pkgname}-common-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ar x "${srcdir}/intel-oneapi-runtime-openmp-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    ar x "${srcdir}/intel-oneapi-runtime-openmp-opencl-shared-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${pkgdir}"
    rm data.tar.xz

    # latest symlink
    local _prefix=/opt/intel/oneapi/compiler
    ln -s "${_prefix}/${_majmin}" "${pkgdir}/${_prefix}/latest"

    # fix permissions
    find "${pkgdir}" -type f \( -iname '*.so' -o -iname '*.so.*' \) -exec chmod +x '{}' \;

    # fix pkgconfig
    local _prefix=/opt/intel/oneapi/compiler
    sed -e "s@prefix=.*@prefix=${_prefix}/latest@g" \
        -i "${pkgdir}/${_prefix}/${_majmin}"/lib/pkgconfig/openmp.pc
    install -d "${pkgdir}"/usr/share/pkgconfig
    ln -s {"${_prefix}"/latest/lib/pkgconfig/,"${pkgdir}"/usr/share/pkgconfig/}openmp.pc

    # ldconfig
    install -d "${pkgdir}"/etc/ld.so.conf.d
    echo "${_prefix}"/${_majmin}/"$(sed -n 's/libdir=${prefix}\///p' "${pkgdir}/${_prefix}/${_majmin}"/lib/pkgconfig/openmp.pc)" \
        > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
    echo "/opt/intel/oneapi/lib/intel64" >> "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
    echo "${_prefix}/latest/linux/compiler/lib/intel64" >> "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
    ln -s /opt/intel/oneapi/compiler/"${_majmin}"/licensing/openmp "${pkgdir}"/usr/share/licenses/"${pkgname}"/openmp
}
